package hu.smiklos.stmm.web.servlet;

import hu.smiklos.stmm.web.common.Page;

import javax.annotation.security.PermitAll;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

/**
 * Created by SebestyenMiklos on 2017. 04. 06..
 */
@PermitAll
@WebServlet("/CreditCard")
public class CreditCardServlet extends BaseServlet {


    @Override
    public void handlePost() throws ServletException, IOException {
        forward(Page.CREDIT_CARD.getJspName());
    }

    @Override
    public void handleGet() throws ServletException, IOException {
        forward(Page.CREDIT_CARD.getJspName());
    }
}