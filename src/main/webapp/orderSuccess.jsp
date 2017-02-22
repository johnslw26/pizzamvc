<%-- 
    Document   : order
    Created on : Feb 7, 2017, 3:13:05 PM
    Author     : John Phillips
--%>

<%@page import="pizzamvc.PizzaOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lucas's JSP Pizza Order</title>
        <link rel="stylesheet" href="mystyle.css">
    </head>
    <body>
        <h1>Thank you for your order!</h1>
        <h2>Order details:</h2>
        <p>Email = ${myOrder.email}</p>
        <p>Size = ${myOrder.size}</p>
        
            <%
                double cost = 0;
                String crust = request.getParameter("crust");
                String size = request.getParameter("size");
                if (crust.equals("pan")) {
                    cost += 1.0;
                }else if(crust.equals("hand")){
                    cost += 0.5;
                }

                if(size.equals("small")){
                    cost += 5.0;
                }else if(size.equals("medium")){
                    cost+=6.0;
                }else if(size.equals("large")){
                    cost+=7.0;
                }
                // Checkboxes from a form may or may not be checked. We can use the
                // following code to get an array of the values that are checked.
                PizzaOrder po = (PizzaOrder) request.getAttribute("myOrder");
                if (po.getToppings() != null && po.getToppings().length != 0) {
                    out.println("<p>Toppings:");
                    for (String myTopping : po.getToppings()) {
                        out.println(myTopping + ", ");
                        cost+= 0.75;
                    }
                    out.println("</p>");
                } else {
                    out.println(" no toppings were requested");
                }
                out.println("<p>Total Cost: $"+cost+"</p");
            %>
        </p>
        <p><a href='home.html'>Return to home page</a></p>
    </body>
</html>
