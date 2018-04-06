package com.echo.jcps.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.echo.jcps.dto.AppointExecution;
import com.echo.jcps.dto.Result;
import com.echo.jcps.entity.Book;
import com.echo.jcps.enums.AppointStateEnum;
import com.echo.jcps.exception.NoNumberException;
import com.echo.jcps.exception.RepeatAppointException;
import com.echo.jcps.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController {

	//private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BookService bookService;
	
	@RequestMapping(value="/ftl",method=RequestMethod.POST)
    public String index(Model model) {
		List<Book> list = bookService.getList();
		System.out.println(list.size());
		model.addAttribute("bookList",list);
		return "index";
    }
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	private String list(Model model){
		List<Book> list = bookService.getList();
		System.out.println(list.size());
		model.addAttribute("bookList",list);
		return "list";
	}
	
	@RequestMapping(value="/test",method = RequestMethod.GET)
	private String test(Model model){
		Book book = new Book();
		book.setName("Java程序设计");
		book.setNumber(100);
		model.addAttribute("book",book);
		return "list";
	}
	
	@RequestMapping(value = "/{bookId}/detail", method = RequestMethod.GET)
    private String detail(@PathVariable("bookId") Long bookId, Model model) {
        if (bookId == null) {
            return "redirect:/book/list";
        }
        Book book = bookService.getById(bookId);
        if (book == null) {
            return "forward:/book/list";
        }
        model.addAttribute("book", book);
        return "detail";
    }

    //ajax json
    @RequestMapping(value = "/{bookId}/appoint", method = RequestMethod.POST, produces = {
            "application/json; charset=utf-8" })
    @ResponseBody
    private Result<AppointExecution> appoint(@PathVariable("bookId") Long bookId, @RequestParam("studentId") Long studentId) {
        if (studentId == null || studentId.equals("")) {
            return new Result<>(false, "学号不能为空");
        }
        //AppointExecution execution = bookService.appoint(bookId, studentId);//错误写法，不能统一返回，要处理异常（失败）情况
        AppointExecution execution = null;
        try {
            execution = bookService.appoint(bookId, studentId);
        } catch (NoNumberException e1) {
            execution = new AppointExecution(bookId, AppointStateEnum.NO_NUMBER);
        } catch (RepeatAppointException e2) {
            execution = new AppointExecution(bookId, AppointStateEnum.REPEAT_APPOINT);
        } catch (Exception e) {
            execution = new AppointExecution(bookId, AppointStateEnum.INNER_ERROR);
        }
        return new Result<AppointExecution>(true, execution);
    }
}
