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
            <% if(recruiter!=null){ %>
            <h1 class="font-semibold underline mt-2 text-lg group-hover:text-green-600"><% out.println(recruiter.getFirstNameRec() + " " + recruiter.getLastNameRec()); %> </h1>
            <% } %>
            <% if(candidate!=null){%>
            <h1 class="font-semibold underline mt-2 text-lg group-hover:text-green-600"><% out.println(candidate.getFirstNameCan() + " " + candidate.getLastNameCan()); %> </h1>
            <% } %>
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
            <button onclick="openModal()" class='font-roboto w-2/6 bg-green-600 text-white rounded-full py-2 px-4 font-semibold hover:shadow-md'>
                Add your job application
            </button>
            <!--debut-->
            <div id="add-post" aria-hidden="true"
                 class="hidden flex overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-4 z-50 justify-center items-center h-modal md:h-full md:inset-0">
                <div class="relative px-4 w-full max-w-xl h-full md:h-full">
                    <!-- Modal content -->
                    <div class="relative rounded-lg shadow bg-gray-700">
                        <div class="flex justify-end p-2">
                            <button type="button"
                                    onclick="closeModal()"
                                    class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-800 dark:hover:text-white"
                                    data-modal-toggle="update-modal">
                                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd"
                                          d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                                          clip-rule="evenodd"></path>
                                </svg>
                            </button>
                        </div>
                        <form method="post" class="px-6 pb-4 space-y-6 lg:px-8 sm:pb-6 xl:pb-8"
                              action="AddPost" enctype="multipart/form-data">
                            <h3 class="text-xl font-medium text-white">Add your candidature post :</h3>
                            <input type="hidden" name="id"
                                   value="">
                            <div>
                                <label for="post"
                                       class="block mb-2 text-sm font-medium text-gray-300">
                                    Describe Yourself</label>
                                <textarea type="text" name="post" id="post"
                                          value=""
                                          class="border text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 w-full p-2.5 bg-gray-600 border-gray-500 text-white"
                                          placeholder="Tell Us About Yourself" required ></textarea>
                            </div>
                            <div>
                                <label for="categories"
                                       class="block mb-2 text-sm font-medium text-gray-300">Categories
                                </label>
                                <button id="showCategories" data-dropdown-toggle="dropdown"
                                        onclick="toggleCategories()"
                                        class="border text-sm rounded-lg inline-flex items-center justify-between focus:ring-emerald-500 focus:border-emerald-500 w-full p-2.5 bg-gray-600 border-gray-500 text-white"
                                        type="button">
                                    Select Categories
                                    <svg class="ml-2 w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7">
                                        </path>
                                    </svg>
                                </button>
                                <div id="categories"
                                     class="hidden z-10 w-full mt-1 text-base list-none rounded-xl divide-y divide-gray-100 shadow bg-gray-600">
                                    <ul class="py-1" aria-labelledby="showCategories">
                                        <li>
                                            <div class="flex items-center py-2 px-4 text-sm">
                                                <input id="checkbox-1" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" >
                                                <label for="checkbox-1" class="ml-3 text-sm hover:bg-gray-600 text-gray-200 hover:text-white">Category 1</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="flex items-center py-2 px-4 text-sm">
                                                <input id="checkbox-2" type="checkbox"
                                                       class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" >
                                                <label for="checkbox-2"
                                                       class="ml-3 text-sm hover:bg-gray-600 text-gray-200 hover:text-white">Category 2</label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="flex items-center py-2 px-4 text-sm">
                                                <input id="checkbox-3" type="checkbox"
                                                       class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" >
                                                <label for="checkbox-3"
                                                       class="ml-3 text-sm hover:bg-gray-600 text-gray-200 hover:text-white">Category 3</label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div>
                                <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300"
                                       for="video" >
                                    Insert Video
                                </label>
                                <input type="file" name="video" id="video" class="block w-full text-sm text-gray-500
                      file:mr-4 file:py-2 file:px-4
                      file:rounded-full file:border-0
                      file:text-sm file:font-semibold
                      file:bg-green-50 file:text-emerald-700
                      hover:file:bg-sky-100
                    " required/>
                            </div>
                            <button type="submit"
                                    class="w-full text-white focus:ring-4  font-medium rounded-lg text-sm px-5 py-2.5 text-center bg-emerald-700 hover:bg-emerald-600 focus:ring-green-700">
                                Post Your Candidature
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            <!---- fin--->
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
            <% if(recruiter!=null){ %>
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
            <% } %>
        </div>
    </div>
</div>
<%@ include file="includes/Footer.jsp" %>


<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>

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

    CKEDITOR.replace("post");
    var shown=false;
    function toggleCategories(){
        if(!shown) {
            var categories = document.getElementById("categories");
            categories.classList.remove("hidden");
            shown=true;
        }
        else{
            var categories = document.getElementById("categories");
            categories.classList.add("hidden");
            shown=false;
        }
    };
    function openModal(){
        var post_modal=document.getElementById("add-post");
        post_modal.classList.remove("hidden");
    };
    function closeModal(){
        var post_modal=document.getElementById("add-post");
        post_modal.classList.add("hidden");
    };
</script>

</body>
</html>