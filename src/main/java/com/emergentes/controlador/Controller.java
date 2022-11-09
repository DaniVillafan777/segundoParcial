package com.emergentes.controlador;

import com.emergentes.modelo.GestorProductos;
import com.emergentes.modelo.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto objProducto = new Producto();
        int id;
        int pos;
        String opcion = request.getParameter("op");
        String op = (opcion != null) ? request.getParameter("op"):"view";
        
        if(op.equals("nuevo")){
            HttpSession ses = request.getSession();
            GestorProductos almacen = (GestorProductos) ses.getAttribute("almacen");
            objProducto.setId(almacen.obtieneId());
            request.setAttribute("op", op);
            request.setAttribute("miproducto", objProducto);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        if(op.equals("modificar")){
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            GestorProductos almacen = (GestorProductos) ses.getAttribute("almacen");
            pos = almacen.ubicarProducto(id);
            objProducto = almacen.getLista().get(pos);
            
            request.setAttribute("op", op);
            request.setAttribute("miproducto", objProducto);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        if(op.equals("eliminar")){
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            GestorProductos almacen = (GestorProductos) ses.getAttribute("almacen");
            pos = almacen.ubicarProducto(id);
            almacen.eliminarProducto(pos);
            ses.setAttribute("almacen", almacen);
            response.sendRedirect("index.jsp");
        }
        if(op.equals("view")){
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Producto objProducto = new Producto();
        int pos;
        String op = request.getParameter("op");
        
        if(op.equals("grabar")){
            //Recuperar valores del formulario
            //Verificar si es nuevo o es una modificacion
            objProducto.setId(Integer.parseInt(request.getParameter("id")));
            objProducto.setDescripcion(request.getParameter("descripcion"));
            objProducto.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
            objProducto.setPrecio(Double.parseDouble(request.getParameter("precio")));
            objProducto.setCategoria(request.getParameter("categoria"));
            
            
        HttpSession ses = request.getSession();
        GestorProductos almacen = (GestorProductos) ses.getAttribute("almacen");
        
        String opg = request.getParameter("opg");
        if(opg.equals("nuevo")){
            almacen.insertarProducto(objProducto);
        }
        else{
            pos = almacen.ubicarProducto(objProducto.getId());
            almacen.modificarProducto(pos, objProducto);
        }
        ses.setAttribute("almacen", almacen);
        response.sendRedirect("index.jsp");
        }
    }
}
