<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>
            <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request">
                Registro de
            </c:if>
            <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request">
                Modificar
            </c:if>
            Producto
        </h1>
        <jsp:useBean id="miProducto" scope="request" class="com.emergentes.modelo.Producto" />

        <form action="Controller" method="post">
            <table>
                <tr>
                    <td>Id</td>
                    <td><input type="number" name="id" value="<jsp:getProperty name="miProducto" property="id" />"></td>
                </tr>
                <tr>
                    <td>Descripcion</td>
                    <td><input type="text" name="descripcion" value="<jsp:getProperty name="miProducto" property="descripcion" />"></td>
                </tr>
                <tr>
                    <td>Cantidad</td>
                    <td><input type="number" name="cantidad" value="<jsp:getProperty name="miProducto" property="cantidad" />"></td>
                </tr>
                <tr>
                    <td>Precio</td>
                    <td><input type="number" step="0.01" name="precio" value="<jsp:getProperty name="miProducto" property="precio" />"></td>
                </tr>
                <tr>
                    <td>Categoria</td>
                    <td><input type="text" name="categoria" value="<jsp:getProperty name="miProducto" property="categoria" />"></td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="opg" value="${requestScope.op}" />
                        <input type="hidden" name="op" value="grabar"/>
                    </td>
                    <td><input type="submit" value="grabar"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
