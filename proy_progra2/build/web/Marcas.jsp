<%-- 
    Document   : Marcas
    Created on : 25/09/2021, 20:45:51
    Author     : User
--%>
<%@page import="Modelo.Marcas"%>
<%@page import="java.util.HashMap"%>
<%@page import="Modelo.Producto"%>
<%@page import="Controlador.controlador"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <title>Marcas</title>
    </head>
    <body>
        
        <div class="container">
            <form action="controlador_marcas" method="post" class="form-group" >
                <h1 align="center">*Formulario de Marcas*</h1>
               
                            <label for="lbl_id_marca"> Id de Marca</label>
                            <input type="text" class="form-control" name="txt_id_marca" id="txt_id_marca" value="0" readonly>
                            <label for="lbl_producto"><b>MARCA</b></label>
                            <input type="text" class="form-control" name="txt_marca" id="txt_marca" placeholder="Nombre de la marca" aria-label="Nombre de la Marca">
                           
                            

                              <center> 
                                <br>
                                <button name="btn_agregar_marcas" id="btn_agregar_marcas" class="btn btn-primary" value="agregar_marca">Agregar Marca</button>
                           
                            <br>
                                <br>
                                <button name="btn_modificar_marcas" id="btn_modificar_marcas" class="btn btn-primary" value="modificar_marca">Modificar Marca</button>
                        
                         <br>
                                <br>
                                <button name="btn_eliminar_marcas" id="btn_eliminar_marcas" class="btn btn-primary" value="eliminar_marca">Eliminar Marca</button>
                           <center/>
                            
                                <center>
                                <div class="list-group" >
                                    <br> <br>
                                    <a href="Marcas.jsp" class="list-group-item list-group-item-action active" aria-current="true">Formulario Marcas</a>
                                   
                                    <a href="Producto.jsp" class="list-group-item list-group-item-action">Formulario Productos</a>
                                    <a href="index.jsp" class="list-group-item list-group-item-action">Inicio</a>
                               
                                </center>
                          
            </form>         
        </div>
         <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Marca </th>
                                </tr>
                            </thead>
                            <tbody id="tbl_marcas">
                                <%
                                Marcas marca = new Marcas();
                                DefaultTableModel tabla = new DefaultTableModel();
                                tabla = marca.leer();
                                for (int t=0;t <tabla.getRowCount();t++){
                                    out.println("<tr data-id="+tabla.getValueAt(t, 0)+" data-id_marca="+tabla.getValueAt(t, 1)+">");
                                    out.println("<td>"+ tabla.getValueAt(t, 1)+"</td>");
                                    //out.println("<td>"+tabla.getValueAt(t,9)+"</td>");
                                    out.println("</tr>");
                                }
                                %>
                            </tbody>
                        </table>
        <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
        
        <script type="text/javascript">
            $("#tbl_marcas").on("click","tr td", function(evt)
            {
                var target, id, id_marca, marca;
                target=$(evt.target);
                id=target.parent().data("id");
                id_marca=target.parent().data("id_marca");
                marca=target.parent("tr").find("td").eq(0).html();
                
                $("#txt_id_marca").val(id);
                $("#txt_marca").val(marca);
        
            });
            
        </script>
    </body>
</html>

