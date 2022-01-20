<%@ page import="com.app.models.Recruiter" %>
<%@ page import="java.util.List" %>
<%@ page import="java.nio.file.Paths" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 20/01/2022
  Time: 12:18
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="stylesheet" href="https://demos.creative-tim.com/notus-js/assets/styles/tailwind.css">
  <link rel="stylesheet" href="https://demos.creative-tim.com/notus-js/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet"/>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="style/css/all.min.css" >
  <meta charset="utf-8">
  <title>Our Recruiters.</title>
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

<body class="relative  bg-gray-200">
<div class="relative pt-16 pb-32 flex content-center items-center justify-center min-h-screen-75">
  <div class="absolute top-0 w-full h-full bg-center bg-cover" style="
        background-image: url('https://images.unsplash.com/photo-1557804506-669a67965ba0?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=1267&amp;q=80');
      ">
    <span id="blackOverlay" class="w-full h-full absolute opacity-75 bg-black"></span>
  </div>
  <div class="container relative mx-auto">
    <div class="items-center flex flex-wrap">
      <div class="w-full mt-10 lg:w-6/12 px-4 mx-auto text-center">
        <div class="">
          <h1 class="text-white font-semibold text-6xl">
            Our <span class="text-emerald-500">Recruiters.</span>
          </h1>
          <p class="mt-8 text-xl text-gray-200">
            Here you find our recruiters all over the world, with different domain interests looking forward
            to seek special <span class="text-emerald-500">profiles</span>
            for providing new <span class="text-emerald-500">opportunities</span>.
          </p>
        </div>
      </div>
    </div>
  </div>
  <div class="top-auto bottom-0 left-0 right-0 w-full absolute pointer-events-none overflow-hidden h-70-px" style="transform: translateZ(0px)">
    <svg class="absolute bottom-0 overflow-hidden" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none" version="1.1" viewBox="0 0 2560 100" x="0" y="0">
      <polygon class="text-gray-200 fill-current" points="2560 0 2560 100 0 100"></polygon>
    </svg>
  </div>
</div>
<section class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-4 py-12">
  <div class="text-center pb-12">
    <h2 class="text-lg font-bold text-emerald-600">
      We provide the best network
    </h2>
    <h1 class="font-bold text-5xl font-heading text-gray-900">
      Check our recruiters
    </h1>
  </div>
  <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <%
      List<Recruiter> recruiters = (List<Recruiter>) session.getAttribute("recruiters");
      for(int i=0;i<recruiters.size();i++){
    %>
    <div class="flex flex-col items-center p-8 transition-colors duration-200 transform cursor-pointer group bg-white shadow-md hover:bg-emerald-600 rounded-xl">
      <img class="object-cover w-32 h-32 rounded-full ring-4 ring-gray-300"
           src="<%=(recruiters.get(i).getImg()!=null) ?
                 "img/" + Paths.get(recruiters.get(i).getImg()).getFileName().toString():
                 "https://images.unsplash.com/photo-1488508872907-592763824245?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"%>"
      >

      <h1
              class="mt-4 text-2xl font-semibold text-gray-700 capitalize  group-hover:text-white"><%=recruiters.get(i).getFirstNameRec()%> <%=recruiters.get(i).getLastNameRec()%></h1>

      <p class="mt-2 text-gray-500 capitalize  group-hover:text-gray-300"><%=recruiters.get(i).getEntrepriseRec()%></p>
      <div class="flex items-center justify-center mt-2 ">
        <div class="mx-2 text-gray-600  hover:text-gray-500  group-hover:text-white"
             aria-label="Email">
          <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
               class="h-5 w-5 fill-current bi bi-envelope-fill" viewBox="0 0 16 16">
            <path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555ZM0 4.697v7.104l5.803-3.558L0 4.697ZM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757Zm3.436-.586L16 11.801V4.697l-5.803 3.546Z"/>
          </svg>
        </div>
        <p class=" text-gray-500 capitalize  group-hover:text-gray-200"><%=recruiters.get(i).getContactEmail()%></p>
      </div>
      <div class="flex mt-8 -mx-2">
        <a href="<%=recruiters.get(i).getLinkedUrl()%>" target="_blank"
           class="mx-2 text-gray-600 group-hover:text-white"
           aria-label="Linkedin">
          <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
               class="h-6 w-6 fill-current bi bi-linkedin" viewBox="0 0 16 16">
            <path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854V1.146zm4.943 12.248V6.169H2.542v7.225h2.401zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248-.822 0-1.359.54-1.359 1.248 0 .694.521 1.248 1.327 1.248h.016zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016a5.54 5.54 0 0 1 .016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225h2.4z"/>
          </svg>
        </a>

        <a href="<%=recruiters.get(i).getFacebookUrl()%>" target="_blank"
           class="mx-2 text-gray-600  hover:text-gray-500  group-hover:text-white"
           aria-label="Facebook">
          <svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor"
               class="h-6 w-6 fill-current bi bi-facebook" viewBox="0 0 16 16">
            <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z"/>
          </svg>
        </a>

        <a href="<%=recruiters.get(i).getTwitterUrl()%>" target="_blank"
           class="mx-2 text-gray-600  hover:text-gray-500  group-hover:text-white" aria-label="Twitter">
          <svg xmlns="http://www.w3.org/2000/svg"  fill="currentColor"
               class=" h-6 w-6 fill-current bi bi-twitter"
               viewBox="0 0 16 16">
            <path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z"/>
          </svg>
        </a>
      </div>
    </div>
    <%
      }
    %>


  </div>
  <footer class="relative mt-10  pt-4 ">
    <div class="container mx-auto px-4">
      <div class="flex flex-wrap items-center md:justify-between justify-center">
        <div class="w-full md:w-6/12 px-4 mx-auto text-center">
          <div class="text-md text-gray-500 font-semibold py-1">
            Made in <a href="/" class="text-gray-700 hover:text-gray-800" target="_blank">Employ. </a> | By <a href="/team" class="text-gray-700 hover:text-blueGray-800" target="_blank"> Our team</a>.
          </div>
        </div>
      </div>
    </div>
  </footer>
</section>
</body>
</html>
