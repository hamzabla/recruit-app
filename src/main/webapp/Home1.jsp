<%@ page import="java.sql.DriverManager" %>
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
<div class="w-3/4 mx-auto h-4/5 flex items-start py-4 justify-between space-x-4 px-10">
    <div class="flex flex-col ml-4 h-full ring-1 bg-white ring-gray-400 rounded-lg shadow-xl space-y-8 w-1/5">
        <div class="flex flex-col items-center mt-6 group cursor-pointer">
            <img
                    src="img/user.png"
                    class="relative h-20 w-20 rounded-full object-cover "
            />
            <h1 class="font-semibold underline mt-2 text-lg group-hover:text-green-600">Your Profile</h1>
        </div>
        <div class="flex flex-col px-4 p space-y-6 border-t border-gray-500">
            <h1 class="text-xl font-body font-semibold text-gray-500 mt-4">
                Categories
            </h1>
            <ul class="flex flex-col">
                <li class="p-2 flex items-center font-body hover:bg-gray-200 transition ease-out rounded-xl">
                    <img
                            src="https://images.unsplash.com/photo-1610563166150-b34df4f3bcd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29tcHV0ZXIlMjBzY2llbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
                            class="rounded-xl h-10 w-10 mr-4"
                    />
                    Computer Science
                </li>
                <li class="p-2 flex items-center font-body hover:bg-gray-200 transition ease-out rounded-xl">
                    <img
                            src="https://images.unsplash.com/photo-1610563166150-b34df4f3bcd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29tcHV0ZXIlMjBzY2llbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
                            class="rounded-xl h-10 w-10 mr-4"
                    />
                    Computer Science
                </li>
                <li class="p-2 flex items-center font-body hover:bg-gray-200 transition ease-out rounded-xl">
                    <img
                            src="https://images.unsplash.com/photo-1610563166150-b34df4f3bcd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29tcHV0ZXIlMjBzY2llbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
                            class="rounded-xl h-10 w-10 mr-4"
                    />
                    Computer Science
                </li>
                <li class="p-2 flex items-center font-body hover:bg-gray-200 transition ease-out rounded-xl">
                    <img
                            src="https://images.unsplash.com/photo-1610563166150-b34df4f3bcd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29tcHV0ZXIlMjBzY2llbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
                            class="rounded-xl h-10 w-10 mr-4"
                    />
                    Computer Science
                </li>
            </ul>
        </div>
    </div>
    <div class="flex flex-col w-4/5 h-full space-y-4 ">
        <div class="flex flex-col space-y-4 h-1/5 items-center bg-white p-4 rounded-lg shadow-xl ring-1 ring-gray-400">
            <div class="flex items-center ml-2  space-x-6">
                <img
                        src="img/user.png"
                        class="relative h-12 w-12 rounded-full "
                />
                <h1>Apply for new opportunities by creating a job application </h1>
            </div>
            <button class='font-roboto w-2/6 bg-green-600 text-white rounded-full py-2 px-4 font-semibold hover:shadow-md'>
                Add your job application
            </button>
        </div>
        <div class="flex flex-col h-4/5 bg-white p-4 rounded-lg shadow-xl ring-1 ring-gray-400">
            <div class="flex items-center justify-between pb-4 border-b border-gray-400 ">
                <div class="flex items-center space-x-6">
                    <img
                            src="img/user.png"
                            class=" rounded-full h-12 w-12"
                    />
                    <h1>Candidate FullName</h1>
                </div>
                <div class=" hover:text-red-600">
                    <i onclick="toggleReact()" id="view_react" class="far fa-heart fa-2x "></i>
                </div>
            </div>
            <div class='flex space-x-6 mt-8 '>
                <div class="w-1/2">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita delectus quis,
                        nesciunt corrupti numquam dolorum reprehenderit tempore rem illum culpa commodi
                        incidunt natus minima excepturi esse a! Fugit, saepe assumenda!Lorem ipsum dolor
                        sit amet consectetur adipisicing elit. Expedita delectus quis,
                        nesciunt corrupti numquam dolorum reprehenderit tempore rem illum culpa commodi
                        incidunt natus minima excepturi esse a! Fugit, saepe assumenda!
                    </p>
                </div>
                <div class="w-1/2 outline-none">
                    <video width="100%" controls autoplay>
                        <source src="img/video1.mp4" type="video/mp4">
                    </video>
                </div>
            </div>
            <div class="mt-10 flex items-center justify-around">
                <button class='font-roboto flex items-center justify-center space-x-2 w-40 bg-red-600 text-white rounded-full p-3 font-bold hover:shadow-md'>
                    <i class="fas fa-times"></i>
                    <p>Not Intersted</p>
                </button>
                <button class='font-roboto flex items-center justify-center space-x-2 w-40 bg-yellow-500 text-white rounded-full p-3 font-bold hover:shadow-md'>
                    <i class="fas fa-star"></i>
                    <p>Very Intersted</p>
                </button>
                <button class='font-roboto flex items-center justify-center space-x-2 w-40 bg-green-600 text-white rounded-full p-3 font-bold hover:shadow-md'>
                    <i class="fas fa-check"></i>
                    <p>Intersted</p>
                </button>
            </div>
        </div>
    </div>
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