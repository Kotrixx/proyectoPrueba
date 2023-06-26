package com.games.luchito.luchoarmy.controllers;

import com.games.luchito.luchoarmy.models.usuario.beans.Usuario;
import com.games.luchito.luchoarmy.models.usuario.daos.UsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Properties;
import java.util.UUID;
import javax.mail.*;
import javax.mail.internet.*;

@WebServlet(name = "RegistroServlet", value = "/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    private static final String codigo = UUID.randomUUID().toString();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "irRegistro";
        switch (action) {
            case "irRegistro":
                request.getRequestDispatcher("usuario/registrar.jsp").forward(request, response);
                break;
            case "regresar":
                request.getRequestDispatcher("usuario/loginPage.jsp").forward(request, response);
                break;
            case "verificar":
                request.getRequestDispatcher("usuario/verificationPage.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "guardar" : request.getParameter("action");
        Usuario user = new Usuario();
        UsuarioDao usuarioDao = new UsuarioDao();
        System.out.println("PRIMERA INSTANCIA DE :"+codigo);
        switch (action) {
            case "guardar":
                user.setNombre(request.getParameter("nombre"));
                user.setApellido(request.getParameter("apellido"));
                user.setCorreo(request.getParameter("correo"));
                user.setTelefono(Integer.parseInt(request.getParameter("telefono")));
                user.setDni(Integer.parseInt(request.getParameter("dni")));
                user.setContrasenha(request.getParameter("contrasena"));
                //validar que la contrasenha sea igual a la anterior para poder pasar sino no.
                String contraConfirmada = request.getParameter("confirmarContrasena");
                System.out.println(user.getNombre());
                System.out.println("ingreso al flujo de registro del objeto usuario");
                //String verificationCode = UUID.randomUUID().toString();
                String verificationCode = codigo;
                System.out.println("Codigo generado: "+verificationCode);
                request.setAttribute("user",user);
                request.setAttribute("codigoGenerado",verificationCode);
                String recipientEmail = user.getCorreo();
                System.out.println(recipientEmail);
                sendVerificationEmail(recipientEmail,verificationCode);
                request.getRequestDispatcher("usuario/verificationPage.jsp").forward(request, response);
                break;

            case "code":
                //verificationCode = (String) request.getAttribute("codigoGenerado");
                Usuario user2 = new Usuario(request.getParameter("nombre"),request.getParameter("apellido"),Integer.parseInt(request.getParameter("dni")),
                        request.getParameter("contrasenha"),Integer.parseInt(request.getParameter("telefono")),request.getParameter("correo"));

                System.out.println("---------METODO POST DE LA VERIFICACION ----------");
                System.out.println(user2.getNombre()+" "+user2.getCorreo());

                //response.sendRedirect("usuario/verificationPage.jsp");
                //request.getRequestDispatcher("usuario/verificationPage.jsp").forward(request, response);

                System.out.println(codigo);
                String codigo = request.getParameter("verificationCode");
                System.out.println("Codigo recibido del fomrulario: "+codigo);
                if(codigo.equals(codigo)){
                    System.out.println("Entra a la validacion");
                    usuarioDao.guardarUsuario(user2);
                    System.out.println("Usuario creado correctamente con validacion de token");
                    response.sendRedirect(request.getContextPath()+"/LoginServlet");

                } else{
                    System.out.println("Error al registrar el codigo del formulario");
                    response.sendRedirect(request.getContextPath()+"/LoginServlet?action=verificar");
                    request.setAttribute("error", "Codigo de verificacion incorrecto");
                    //request.getRequestDispatcher("usuario/verificationPage2.jsp").forward(request, response);
                }

        }
    }


    public static void sendVerificationEmail(String recipientEmail, String verificationCode) {
        final String username = "luchito.army.games@gmail.com";
        final String password = "zgofggtxtqtqepse";

        // Configurar propiedades para la conexión SMTP de Gmail
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Autenticación del nombre de usuario y contraseña
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("LuchitoGames - Verifica tu cuenta");
            // Generar un token de verificación único utilizando UUID
            message.setContent("<h1>Verficacion de la cuenta</h1>"
                    + "<p>Se ha intentado el registro de una cuenta en LuchitoGames con este correo. Ingresa el siguiente condigo de verificacion para completar su registro</p>"
                    + "<h2>" + verificationCode + "</h2>"
                    + "<p>This code is time-sensitive and will expire shortly.</p>","text/html");
            Transport.send(message);
            System.out.println("Correo enviado exitosamente");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }


}
