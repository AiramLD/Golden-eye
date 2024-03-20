package com.codebay.goldeneye;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExceptionController implements ErrorController {


    @RequestMapping("/error")
    public ModelAndView handleError(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("error");
        int errorStatus = (Integer) request.getAttribute("javax.servlet.error.status_code");
        String errorMessage = (String) request.getAttribute("javax.servlet.error.message");
        String requestUri = (String) request.getAttribute("javax.servlet.error.request_uri");

        modelAndView.addObject("errorStatus", errorStatus);
        modelAndView.addObject("errorMessage", errorMessage);
        modelAndView.addObject("requestUri", requestUri);

        handleSpecificErrorMessages(errorStatus, modelAndView);

        return modelAndView;
    }

    private void handleSpecificErrorMessages(int errorStatus, ModelAndView modelAndView) {
        switch (errorStatus) {
            case 404: // HttpStatus.NOT_FOUND.value():
                modelAndView.addObject("errorMessage", "La página solicitada no fue encontrada.");
                break;
            case 500: // HttpStatus.INTERNAL_SERVER_ERROR.value():
                modelAndView.addObject("errorMessage", "Se produjo un error interno en el servidor.");
                break;
            case 200:
                modelAndView.addObject("errorMessage", "La pagina parece estar cargada. Por favor, intentalo nuevamente más tarde.");
                break;
            default:
                break;
        }
    }
    
    @ExceptionHandler(Exception.class)
    public ModelAndView handleException(Exception ex) {
        ex.printStackTrace();

        ModelAndView modelAndView = new ModelAndView("error");
        modelAndView.addObject("errorStatus", HttpStatus.INTERNAL_SERVER_ERROR.value());
        modelAndView.addObject("errorMessage", "Se produjo un error en la aplicación. Por favor, intentalo nuevamente más tarde.");
        return modelAndView;
    }

    @ExceptionHandler({ HttpClientErrorException.class, HttpServerErrorException.class })
    public ModelAndView handleHttpClientErrors(Exception ex) {
        ModelAndView modelAndView = new ModelAndView("error");
        HttpStatus status = (ex instanceof HttpClientErrorException)
                ? ((HttpClientErrorException) ex).getStatusCode()
                : ((HttpServerErrorException) ex).getStatusCode();
        modelAndView.setStatus(status);
        modelAndView.addObject("errorStatus", status.value());
        modelAndView.addObject("errorMessage", ex.getMessage());
        return modelAndView;
    }

    @Override
    public String getErrorPath() {
        return "/error";
    }
}