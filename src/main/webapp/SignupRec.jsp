<%--
  Created by IntelliJ IDEA.
  User: najiy
  Date: 12/28/2021
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <title>Employ | Work Marketplace.</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="style/css/all.min.css" >
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config={
            mode:'jit',
            theme: {
                extend: {
                    fontFamily: {
                        'body':["Lato",'sans-serif'],
                        'roboto':["Roboto",'sans-serif'],
                        'poppings':["Poppings",'sans-serif'],
                        'niramit':["Niramit",'sans-serif'],
                        'black':["Black Han Sans",'sans-serif']
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
    <div class='mx-auto absolute top-0 w-screen h-24 flex items center justify-center bg-white shadow-lg py-4 px-10'>
        <a href="/" class="absolute top-3 cursor-pointer ">
            <img
                    src="img/employ_logo.png"
                    class="w-full h-16"
            />
        </a>
    </div>
    <p id="demo" class='p-10 text-3xl md:text-3xl text-white text-center font-niramit font-bold'>Sign up</p>
    <main class=' container flex flex-col items-center space-y-20 bg-white w-[600px] h-[550px] rounded-2xl shadow-2xl py-6'>
        <% if (request.getAttribute("error") != null) { %>
        <p class='p-1 text-xl text-red-600 text-center font-body'><% out.println(request.getAttribute("error")); %></p>
        <% } %>
        <form action="SignUpRec" method="post" class='h-full flex flex-grow flex-col justify-evenly items-center'>
            <div class='flex items-center space-x-4 py-2 focus:border-gray-800 w-5/6'>
                <input type='text' name='firstname' required placeholder='First name' class='font-niramit text-xl outline-none border-b w-1/2 border-gray-400 ' />
                <input type='text' name='lastname' required placeholder='Last name' class='font-niramit text-xl outline-none border-b w-1/2 border-gray-400' />
            </div>
            <input type='email' name='email' required placeholder='e-mail' class='w-5/6 font-niramit text-xl border-b border-gray-400 outline-none py-2 focus:border-gray-800' />
            <div class='flex items-center justify-between py-2 focus:border-gray-800 w-5/6 border-b border-gray-400'>
                <input type='password' name='password1' id="password1" required placeholder='Password' class='font-niramit text-xl outline-none ' />
                <i onclick="togglePass()" id="view_pass" class="fas fa-eye "></i>
            </div>
            <div class='flex items-center justify-between py-2 focus:border-gray-800 w-5/6 border-b border-gray-400'>
                <input type='password2' name='password2' id="password2" required placeholder='Confirm password' class='font-niramit text-xl outline-none ' />
                <i onclick="togglePassCon()" id="view_pass_con" class="fas fa-eye "></i>
            </div>
            <div class='flex items-center justify-between py-2 focus:border-gray-800 w-5/6 '>
                <label class='font-niramit text-xl text-gray-800' >Gender</label>
                <input type="radio" id="male" name="gender" value="male"/>
                <label class='font-niramit text-lg text-gray-700'  for="male">Male</label>
                <input type="radio" id="female" name="gender" value="female"/>
                <label class='font-niramit text-lg text-gray-700'  for="female">Female</label>
            </div>
            <input type='text' name='company' required placeholder='Society / Company' class='w-5/6 font-niramit text-xl border-b border-gray-400 outline-none py-2 focus:border-gray-800' />
            <div class='flex items-center justify-between py-2 focus:border-gray-800 w-5/6 '>
                <label
                        class='font-niramit text-xl text-gray-800'
                        for="experience">Durée d'expérience</label>
                <input class='w-20' type="number" id="experience" name="experience"
                       min="1" max="50"/>
            </div>
            <input type='submit' value='Register' class=' mt-2 font-niramit text-xl text-white font-bold py-2 px-4 cursor-pointer bg-gray-400 rounded-full' />

        </form>

    </main>
</div>
<script>
    var pass_shown=false;
    function togglePass(){
        if(pass_shown){
            document.getElementById("password1").setAttribute("type","password");
            document.getElementById("view_pass").setAttribute("class","fas fa-eye")
            pass_shown=false;
        }
        else{
            document.getElementById("password1").setAttribute("type","text");
            document.getElementById("view_pass").setAttribute("class","fas fa-eye-slash")
            pass_shown=true;
        }
    }
    var pass_con_shown=false;
    function togglePassCon(){
        if(pass_con_shown){
            document.getElementById("password2").setAttribute("type","password");
            document.getElementById("view_pass_con").setAttribute("class","fas fa-eye")
            pass_con_shown=false;
        }
        else{
            document.getElementById("password2").setAttribute("type","text");
            document.getElementById("view_pass_con").setAttribute("class","fas fa-eye-slash")
            pass_con_shown=true;
        }
    }



</script>
</html>
