<%--
  Created by IntelliJ IDEA.
  User: najiy
  Date: 1/16/2022
  Time: 11:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add post</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style/css/all.min.css" >
    <meta charset="utf-8">
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
<body>
<div id="add-post" aria-hidden="true"
     class="hidden flex overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-4 z-50 justify-center items-center h-modal md:h-full md:inset-0">
    <div class="relative px-4 w-full max-w-xl h-full md:h-auto">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
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
                <h3 class="text-xl font-medium text-gray-900 dark:text-white">Add your candidature post :</h3>
                <input type="hidden" name="id"
                       value="">
                <div>
                    <label for="post"
                           class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                        Describe Yourself</label>
                    <textarea type="text" name="post" id="post"
                              value=""
                              class="border text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 w-full p-2.5 bg-gray-600 border-gray-500 text-white"
                              placeholder="Tell Us About Yourself" required ></textarea>
                </div>
                <div>
                    <label for="categories"
                           class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Categories
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
</body>
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>

<script>
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
</html>
