<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.app.models.Category" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
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
<body class="bg-gray-100 h-screen">
<%@ include file="includes/Header.jsp" %>





<div class="min-h-screen bg-indigo-50">
    <nav>
        <div class="w-full bg- bg-gradient-to-tr from-green-400 to-green-700 py-6 flex items-center justify-between px-6 md:px-20 xl:px-60">
            <h1 class="text-white text-2xl font-semibold">Categories</h1>
            <div class="flex items-center space-x-10">
                <div class="hidden lg:block">
                    <span class="text-xl text-white font-thin cursor-pointer">Search:</span>
                    <input type="text" class="py-1 px-2 outline-none rounded-md w-60" />
                </div>
                <button class="border border-white px-4 py-1 rounded-md text-white text-xl">didn't find yours ?</button>
            </div>
        </div>
    </nav>
    <main>

        <div class="container w-full md:px-40 mx-auto py-20">
            <div class="md:grid lg:grid-cols-3 md:grid-cols-2 mlg:grid-cols-3 md:gap-10 space-y-6 md:space-y-0 px-10 md:px-0 mx-auto">
                <%
                    List<Category> categoryList = (List<Category>) session.getAttribute("categoryList");
                    if (categoryList!=null){
                        for(int i=0;i<categoryList.size();i++){
                %>
                <div class="bg-white p-6 shadow-md rounded-md">

                    <h3 class="text-xl text-gray-800 font-semibold mb-3"><%=categoryList.get(i).getCategory()%></h3>
                    <p class="mb-2"><%=categoryList.get(i).getCategoryDesciption()%></p>
                    <a href="GetAllPostByCategory?idCategory=<%=categoryList.get(i).getIdCategory()%>"><button class="text-lg font-semibold text-gray-700 bg-indigo-100 px-4 py-1 block mx-auto rounded-md">See Candidates</button></a>


                </div>
                <%
                    }
                    }
                %>

            </div>
        </div>
    </main>
</div>






<%@ include file="includes/Footer.jsp" %>
<script>
    var react = false;
    function toggleReact() {
        if (react) {
            document.getElementById("view_react").setAttribute("class", "far fa-heart fa-2x")
            react = false;
        } else {
            document.getElementById("view_react").setAttribute("class", "fas fa-heart text-red-600 fa-2x")
            react = true;
        }
    }
</script>
</body>
</html>