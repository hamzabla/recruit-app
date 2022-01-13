<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.app.models.Recruiter" %>
<%@ page import="com.app.models.Candidate" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <title>Employ | Work Marketplace.</title>
    <link rel="stylesheet" href="style/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet"/>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            mode: 'jit',
            theme: {
                extend: {
                    fontFamily: {
                        'body': ["Lato", 'sans-serif'],
                        'roboto': ["Roboto", 'sans-serif'],
                        'poppings': ["Poppings", 'sans-serif'],
                        'niramit': ["Niramit", 'sans-serif'],
                        'black': ["Black Han Sans", 'sans-serif']
                    },
                    boxShadow: {
                        '5xl': '20px 20px 20px rgba(0,0,1,0.5)',
                    }
                },
            }
        }
    </script>
    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto {
                content-visibility: auto;
            }
        }
    </style>
</head>
<style>
</style>
<div class='absolute flex flex-col bg-gradient-to-r from-green-900 to-green-800 h-screen w-screen justify-center items-center '>
    <%  Recruiter recruiter = (Recruiter) session.getAttribute("recruiter");
        Candidate candidate = (Candidate) session.getAttribute("candidate");
        if (recruiter != null || candidate!=null)
            response.sendRedirect("Home.jsp");
    %>
    <div class='mx-auto absolute top-0 w-screen h-24 flex items center justify-center bg-white shadow-lg py-4 px-10'>
        <a href="/" class="absolute top-3 cursor-pointer ">
            <img
                    src="img/employ_logo.png"
                    class="w-full h-16"
            />
        </a>
    </div>

    <p class='p-4 text-2xl md:text-3xl text-white text-center font-niramit font-bold'>Sign in to access your account</p>

    <main class=' container flex flex-col items-center justify-between bg-white md:w-96 w-80 h-96 rounded-2xl shadow-2xl'>
        <% if (request.getAttribute("error") != null) { %>
        <p class='p-4 text-xl text-red-600 text-center font-body'><% out.println(request.getAttribute("error")); %></p>
        <% } %>
        <button class='flex items-center  h-16 p-3 mt-6 w-5/6 border border-black rounded-md group hover:bg-indigo-50 duration-150 transition ease-out '>
            <img class='h-6' src="https://img.icons8.com/color/48/000000/google-logo.png"/>
            <p class='group-hover:text-blue-800 flex-grow text-sm font-semibold font-poppings'>Sign in with Google</p>
        </button>
        <p class='border-b  border-gray-400 text-white w-5/6'> g</p>
        <form action="Login" method="post" class='h-full flex flex-grow flex-col justify-evenly items-center'>
            <input name="email" id="text1" type="text" value="" placeholder="Email" required
                   class='w-full font-niramit text-xl border-b border-gray-400 outline-none py-2 focus:border-gray-800'/>
            <div class='flex items-center justify-between py-2 focus:border-gray-800 border-b border-gray-400'>
                <input type=password name='password' id="password" required placeholder='Password'
                       class='font-niramit text-xl outline-none '/>
                <i onclick="togglePass()" id="view_pass" class="fas fa-eye"></i>
            </div>
            <input type='submit' id="submit" value='Sign in'
                   class=' mt-2 font-poppings text-xl text-white font-semibold py-2 px-4 cursor-pointer bg-green-700 rounded-full'/>
            <div class='mb-2 flex flex-col justify-center items-center'>
                <p class=' text-xl font-niramit'>You don't have an account ?</p>
                <a href="prf.jsp"
                   class='font-niramit text-lg underline text-purple-900 active:text-red-700 cursor-pointer'>Register</a>
            </div>
        </form>
    </main>
</div>
<script>
    var pass_shown = false;

    function togglePass() {
        if (pass_shown) {
            document.getElementById("password").setAttribute("type", "password");
            document.getElementById("view_pass").setAttribute("class", "fas fa-eye")
            pass_shown = false;
        } else {
            document.getElementById("password").setAttribute("type", "text");
            document.getElementById("view_pass").setAttribute("class", "fas fa-eye-slash")
            pass_shown = true;
        }
    }


</script>
</html>