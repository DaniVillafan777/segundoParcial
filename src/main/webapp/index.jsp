<%@page import="com.emergentes.modelo.Producto"%>
<%@page import="com.emergentes.modelo.GestorProductos"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  if(session.getAttribute("almacen") == null){
      GestorProductos objeto1 = new GestorProductos();
      
      objeto1.insertarProducto(new Producto(1, "Coca Cola",100,10, "Bebidas"));
      objeto1.insertarProducto(new Producto(2, "Pepsi",50,11, "Bebidas"));
      objeto1.insertarProducto(new Producto(3, "Frack",100,2.50, "Bebidas"));
      objeto1.insertarProducto(new Producto(4, "Cerranitas",80,1.50, "Bebidas"));
      
      session.setAttribute("almacen", objeto1);
  }  
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL - PRODUCTOS</title>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>SEGUNDO PARCIAL TEM-742</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Nombre: DANIEL JHOVANY VILLAFAN SACA</td>
                </tr>
                <tr>
                    <td>Carnet: 12455218 L.P.</td>
                </tr>
            </tbody>
        </table>

        <h1>PRODUCTOS</h1>
        <a href="Controller?op=nuevo">Nuevo Producto</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Descripcion</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Categoria</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
            <c:forEach var="item" items="${sessionScope.almacen.getLista()}">
                <tr>
                    <td>${item.id}</td>
                    <td>${item.descripcion}</td>
                    <td>${item.cantidad}</td>
                    <td>${item.precio}</td>
                    <td>${item.categoria}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
