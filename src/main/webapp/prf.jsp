<%--
  Created by IntelliJ IDEA.
  User: najiy
  Date: 12/28/2021
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style/css/all.min.css" >
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet"/>
    <meta charset="utf-8">
    <title>Employ | Work Marketplace.</title>
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
<div class='absolute flex flex-col bg-gradient-to-r from-green-900 to-green-800 h-screen w-screen justify-center items-center '>
     <div class='mx-auto absolute top-0 w-screen h-24 flex items center justify-center bg-white shadow-lg py-4 px-10'>
         <a href="/" class="absolute top-3 cursor-pointer ">
             <img
                     src="img/employ_logo.png"
                     class="w-full h-16"
             />
         </a>
     </div>
    <p id="demo" class='p-10 text-3xl md:text-3xl text-white text-center font-niramit font-bold'>Who are you ?</p>
    <main class='flex space-x-8 mt-6'>
        <a href="SignupRec.jsp" class=' container flex flex-col items-center bg-white w-96 h-96 rounded-2xl shadow-2xl cursor-pointer'>
            <h1 class='text-4xl mt-6 text-gray-800 font-bold font-body '>Recruiter</h1>
            <img  src="https://images.unsplash.com/photo-1598257006458-087169a1f08d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVjcnVpdGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
                  class='mt-6 rounded-full w-52 h-52 object-cover shadow-xl'
            />
            <p class='mt-4 text-lg text-center text-gray-800 font-body w-5/6' >Find and hire interesting profiles</p>
        </a>
        <a href="SignupCan.jsp" class=' container flex flex-col items-center bg-white w-96 h-96 rounded-2xl shadow-2xl cursor-pointer'>
            <h1 class='text-4xl mt-6 text-gray-800 font-bold font-body '>Candidate</h1>
            <img  src="https://media.istockphoto.com/photos/group-of-candidate-waiting-for-a-job-interview-in-the-office-picture-id1280506989?b=1&k=20&m=1280506989&s=170667a&w=0&h=NOrjN67wEKmGkBwYoGLfwu0DVQPCufvOzSzuqK1lxtg="
                  class='mt-6 rounded-full w-52 h-52 object-cover'
            />
            <p class='mt-4 text-lg text-center text-gray-800 font-body w-5/6'>Show yourself to recruiters for opportunities</p>

        </a>
    </main>
</div>
</html>
