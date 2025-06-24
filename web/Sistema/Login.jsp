<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.io.*, org.mindrot.jbcrypt.BCrypt, java.util.*, java.time.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script>
            function debugAlert(mensaje) {
                alert("DEBUG LOGIN: " + mensaje);
            }
            
            function errorAlert(mensaje) {
                alert("ERROR: " + mensaje);
            }
            
            function successAlert(mensaje) {
                alert("SUCCESS: " + mensaje);
            }
        </script>
    </head>
    <body>
        <%
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            String clientIP = request.getRemoteAddr();
            
            // Debugging inicial
            out.println("<script>debugAlert('Iniciando proceso de login para: " + (correo != null ? correo : "null") + "');</script>");
            out.println("<script>debugAlert('IP del cliente: " + clientIP + "');</script>");
            
            // Validación de parámetros
            if (correo == null || correo.trim().isEmpty()) {
                out.println("<script>errorAlert('El campo correo está vacío');window.location='../iniciodesesion.jsp';</script>");
                return;
            }
            
            if (contrasena == null || contrasena.trim().isEmpty()) {
                out.println("<script>errorAlert('El campo contraseña está vacío');window.location='../iniciodesesion.jsp';</script>");
                return;
            }
            
            correo = correo.trim();
            out.println("<script>debugAlert('Parámetros validados correctamente');</script>");
            
            Connection c = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                out.println("<script>debugAlert('Intentando conectar a la base de datos...');</script>");
                
                // Cambiar a driver moderno
                Class.forName("com.mysql.cj.jdbc.Driver");
                c = DriverManager.getConnection("jdbc:mysql://localhost:3306/Kidi?useSSL=false&serverTimezone=UTC", "root", "n0m3l0");
                
                out.println("<script>debugAlert('Conexión a BD exitosa');</script>");
                
                // Verificar intentos fallidos por IP y email
                out.println("<script>debugAlert('Verificando intentos fallidos...');</script>");
                
                String checkAttemptsQuery = "SELECT intentos_fallidos, ultimo_intento FROM login_attempts WHERE (ip_address = ? OR email = ?) AND ultimo_intento > DATE_SUB(NOW(), INTERVAL 15 MINUTE)";
                ps = c.prepareStatement(checkAttemptsQuery);
                ps.setString(1, clientIP);
                ps.setString(2, correo);
                rs = ps.executeQuery();
                
                int intentosFallidos = 0;
                Timestamp ultimoIntento = null;
                
                if (rs.next()) {
                    intentosFallidos = rs.getInt("intentos_fallidos");
                    ultimoIntento = rs.getTimestamp("ultimo_intento");
                    out.println("<script>debugAlert('Intentos fallidos encontrados: " + intentosFallidos + "');</script>");
                } else {
                    out.println("<script>debugAlert('No se encontraron intentos fallidos recientes');</script>");
                }
                
                rs.close();
                ps.close();
                
                // Si hay muchos intentos, verificar si ha pasado el tiempo de bloqueo
                if (intentosFallidos >= 5) {
                    out.println("<script>debugAlert('Usuario bloqueado por intentos fallidos');</script>");
                    
                    if (ultimoIntento != null) {
                        long tiempoTranscurrido = System.currentTimeMillis() - ultimoIntento.getTime();
                        long tiempoEspera = 15 * 60 * 1000; // 15 minutos en milisegundos
                        
                        if (tiempoTranscurrido < tiempoEspera) {
                            long minutosRestantes = (tiempoEspera - tiempoTranscurrido) / (60 * 1000);
                            out.println("<script>errorAlert('Cuenta bloqueada. Tiempo restante: " + minutosRestantes + " minutos');window.location='../index.html';</script>");
                            return;
                        } else {
                            // Reset counter si ha pasado el tiempo
                            out.println("<script>debugAlert('Tiempo de bloqueo expirado, reseteando contador...');</script>");
                            String resetQuery = "DELETE FROM login_attempts WHERE (ip_address = ? OR email = ?) AND ultimo_intento <= DATE_SUB(NOW(), INTERVAL 15 MINUTE)";
                            ps = c.prepareStatement(resetQuery);
                            ps.setString(1, clientIP);
                            ps.setString(2, correo);
                            int deleted = ps.executeUpdate();
                            ps.close();
                            out.println("<script>debugAlert('Registros eliminados: " + deleted + "');</script>");
                            intentosFallidos = 0;
                        }
                    }
                }
                
                jakarta.servlet.http.HttpSession userSession = request.getSession();
                
                String[] tables = {"ADMIN_", "USUARIO", "TUTOR"};
                String[] emailColumns = {"CORREO_A", "CORREO_U", "CORREO_T"};
                String[] passwordColumns = {"CONTRA_A", "CONTRASEÑA_U", "CONTRA_T"};
                String[] redirigir = {"../Admin/menu_A", "menu", "../Tutor/menu_T"};
                boolean authenticated = false;
                
                out.println("<script>debugAlert('Iniciando búsqueda del usuario en las tablas...');</script>");
                
                for (int i = 0; i < tables.length; i++) {
                    out.println("<script>debugAlert('Buscando en tabla: " + tables[i] + "');</script>");
                    
                    String query = "SELECT * FROM " + tables[i] + " WHERE " + emailColumns[i] + " = ?";
                    ps = c.prepareStatement(query);
                    ps.setString(1, correo);
                    rs = ps.executeQuery();
                    
                    if (rs.next()) {
                        out.println("<script>debugAlert('Usuario encontrado en tabla: " + tables[i] + "');</script>");
                        
                        String hashAlmacenado = rs.getString(passwordColumns[i]);
                        
                        if (hashAlmacenado == null || hashAlmacenado.trim().isEmpty()) {
                            out.println("<script>debugAlert('Hash de contraseña vacío o nulo en BD');</script>");
                            rs.close();
                            ps.close();
                            continue;
                        }
                        
                        out.println("<script>debugAlert('Verificando contraseña con BCrypt...');</script>");
                        
                        try {
                            boolean passwordMatch = BCrypt.checkpw(contrasena, hashAlmacenado);
                            out.println("<script>debugAlert('Resultado verificación BCrypt: " + passwordMatch + "');</script>");
                            
                            if (passwordMatch) {
                                out.println("<script>debugAlert('Contraseña correcta, limpiando intentos fallidos...');</script>");
                                
                                // Login exitoso - limpiar intentos fallidos
                                String clearAttemptsQuery = "DELETE FROM login_attempts WHERE ip_address = ? OR email = ?";
                                PreparedStatement clearPs = c.prepareStatement(clearAttemptsQuery);
                                clearPs.setString(1, clientIP);
                                clearPs.setString(2, correo);
                                int cleared = clearPs.executeUpdate();
                                clearPs.close();
                                
                                out.println("<script>debugAlert('Intentos fallidos limpiados: " + cleared + " registros');</script>");
                                
                                userSession.setAttribute("userEmail", correo);
                                userSession.setAttribute("userType", tables[i].replace("_", ""));
                                authenticated = true;
                                
                                out.println("<script>successAlert('Login exitoso, redirigiendo a: " + redirigir[i] + ".jsp');window.location='" + redirigir[i] + ".jsp';</script>");
                                return;
                            } else {
                                out.println("<script>debugAlert('Contraseña incorrecta, registrando intento fallido...');</script>");
                                // Contraseña incorrecta - registrar intento fallido
                                registrarIntentoFallidoConDebug(c, clientIP, correo, out);
                                out.println("<script>errorAlert('Contraseña incorrecta');window.location='../iniciodesesion.jsp';</script>");
                                return;
                            }
                        } catch (Exception bcryptEx) {
                            out.println("<script>debugAlert('Error en BCrypt: " + bcryptEx.getMessage() + "');</script>");
                            // Posible problema con el hash, registrar como intento fallido
                            registrarIntentoFallidoConDebug(c, clientIP, correo, out);
                            out.println("<script>errorAlert('Error de autenticación');window.location='../iniciodesesion.jsp';</script>");
                            return;
                        }
                    } else {
                        out.println("<script>debugAlert('Usuario no encontrado en tabla: " + tables[i] + "');</script>");
                    }
                    
                    rs.close();
                    ps.close();
                }
                
                if (!authenticated) {
                    out.println("<script>debugAlert('Usuario no encontrado en ninguna tabla, registrando intento fallido...');</script>");
                    // Usuario no encontrado - registrar intento fallido
                    registrarIntentoFallidoConDebug(c, clientIP, correo, out);
                    out.println("<script>errorAlert('Usuario no encontrado');window.location='../iniciodesesion.jsp';</script>");
                }
                
            } catch (ClassNotFoundException e) {
                out.println("<script>debugAlert('Error: Driver MySQL no encontrado - " + e.getMessage() + "');</script>");
                out.println("<script>errorAlert('Error del sistema: Driver de base de datos no encontrado');window.location='../iniciodesesion.jsp';</script>");
            } catch (SQLException e) {
                out.println("<script>debugAlert('Error SQL: " + e.getMessage() + " - Código: " + e.getErrorCode() + "');</script>");
                out.println("<script>errorAlert('Error de base de datos: " + e.getMessage() + "');window.location='../iniciodesesion.jsp';</script>");
            } catch (Exception e) {
                out.println("<script>debugAlert('Error general: " + e.getMessage() + "');</script>");
                out.println("<script>errorAlert('Error del sistema: " + e.getMessage() + "');window.location='../iniciodesesion.jsp';</script>");
            } finally {
                out.println("<script>debugAlert('Cerrando recursos de BD...');</script>");
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (c != null) c.close();
                    out.println("<script>debugAlert('Recursos cerrados correctamente');</script>");
                } catch (SQLException e) {
                    out.println("<script>debugAlert('Error cerrando recursos: " + e.getMessage() + "');</script>");
                }
            }
        %>
        
        <%!
            private void registrarIntentoFallidoConDebug(Connection c, String ip, String email, JspWriter out) throws SQLException, java.io.IOException {
                out.println("<script>debugAlert('Registrando intento fallido para IP: " + ip + ", Email: " + email + "');</script>");
                
                // Verificar si ya existe un registro
                String checkQuery = "SELECT intentos_fallidos FROM login_attempts WHERE ip_address = ? AND email = ?";
                PreparedStatement checkPs = c.prepareStatement(checkQuery);
                checkPs.setString(1, ip);
                checkPs.setString(2, email);
                ResultSet checkRs = checkPs.executeQuery();
                
                if (checkRs.next()) {
                    // Actualizar registro existente
                    int intentos = checkRs.getInt("intentos_fallidos") + 1;
                    out.println("<script>debugAlert('Actualizando registro existente. Nuevos intentos: " + intentos + "');</script>");
                    
                    String updateQuery = "UPDATE login_attempts SET intentos_fallidos = ?, ultimo_intento = NOW() WHERE ip_address = ? AND email = ?";
                    PreparedStatement updatePs = c.prepareStatement(updateQuery);
                    updatePs.setInt(1, intentos);
                    updatePs.setString(2, ip);
                    updatePs.setString(3, email);
                    int updated = updatePs.executeUpdate();
                    updatePs.close();
                    
                    out.println("<script>debugAlert('Registro actualizado. Filas afectadas: " + updated + "');</script>");
                } else {
                    // Crear nuevo registro
                    out.println("<script>debugAlert('Creando nuevo registro de intento fallido');</script>");
                    
                    String insertQuery = "INSERT INTO login_attempts (ip_address, email, intentos_fallidos, ultimo_intento) VALUES (?, ?, 1, NOW())";
                    PreparedStatement insertPs = c.prepareStatement(insertQuery);
                    insertPs.setString(1, ip);
                    insertPs.setString(2, email);
                    int inserted = insertPs.executeUpdate();
                    insertPs.close();
                    
                    out.println("<script>debugAlert('Nuevo registro creado. Filas insertadas: " + inserted + "');</script>");
                }
                
                checkRs.close();
                checkPs.close();
            }
            
            // Método original sin debugging para compatibilidad
            private void registrarIntentoFallido(Connection c, String ip, String email) throws SQLException {
                String checkQuery = "SELECT intentos_fallidos FROM login_attempts WHERE ip_address = ? AND email = ?";
                PreparedStatement checkPs = c.prepareStatement(checkQuery);
                checkPs.setString(1, ip);
                checkPs.setString(2, email);
                ResultSet checkRs = checkPs.executeQuery();
                
                if (checkRs.next()) {
                    int intentos = checkRs.getInt("intentos_fallidos") + 1;
                    String updateQuery = "UPDATE login_attempts SET intentos_fallidos = ?, ultimo_intento = NOW() WHERE ip_address = ? AND email = ?";
                    PreparedStatement updatePs = c.prepareStatement(updateQuery);
                    updatePs.setInt(1, intentos);
                    updatePs.setString(2, ip);
                    updatePs.setString(3, email);
                    updatePs.executeUpdate();
                    updatePs.close();
                } else {
                    String insertQuery = "INSERT INTO login_attempts (ip_address, email, intentos_fallidos, ultimo_intento) VALUES (?, ?, 1, NOW())";
                    PreparedStatement insertPs = c.prepareStatement(insertQuery);
                    insertPs.setString(1, ip);
                    insertPs.setString(2, email);
                    insertPs.executeUpdate();
                    insertPs.close();
                }
                
                checkRs.close();
                checkPs.close();
            }
        %>
    </body>
</html>