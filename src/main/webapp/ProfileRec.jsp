<%@ page import="com.app.models.Candidate" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 18/01/2022
  Time: 12:33
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
    <title>Your Profile.</title>
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
<body class="profile-page">
<%@ include file="includes/Header.jsp" %>
<section class="relative block h-500-px">
    <div class="absolute top-0 w-full h-full bg-center bg-cover" style="
                background-image: url('https://images.unsplash.com/photo-1499336315816-097655dcfbda?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=2710&amp;q=80');
              ">
        <span id="blackOverlay" class="w-full h-full absolute opacity-50 bg-black"></span>
    </div>
    <div class="top-auto bottom-0 left-0 right-0 w-full absolute pointer-events-none overflow-hidden h-70-px" style="transform: translateZ(0px)">
        <svg class="absolute bottom-0 overflow-hidden" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none" version="1.1" viewBox="0 0 2560 100" x="0" y="0">
            <polygon class="text-blueGray-200 fill-current" points="2560 0 2560 100 0 100"></polygon>
        </svg>
    </div>
</section>
<section class="relative py-16 bg-blueGray-200">
    <%
        Recruiter recruiterPrf = (Recruiter) session.getAttribute("recruiterPrf");
    %>
    <div class="container mx-auto px-4">
        <div class="relative flex flex-col min-w-0 break-words bg-white w-full mb-6 shadow-xl rounded-lg -mt-64">
            <div class="px-6">
                <div class="flex flex-wrap justify-center">
                    <div class="w-full lg:w-3/12 px-4 lg:order-2 flex justify-center">
                        <% if (recruiterPrf.getImg()!=null)
                        {
                        %>
                        <div class="relative">
                            <img src="<%=recruiterPrf.getImg()%>" class="shadow-xl rounded-full h-auto align-middle border-none absolute -m-16 -ml-20 lg:-ml-16 max-w-150-px">
                        </div>
                        <% }else
                        {
                        %>
                        <div class="relative">
                            <img src="https://demos.creative-tim.com/notus-js/assets/img/team-2-800x800.jpg" class="shadow-xl rounded-full h-auto align-middle border-none absolute -m-16 -ml-20 lg:-ml-16 max-w-150-px">
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <% if(recruiter!=null){
                        if (recruiterPrf.getIdRec()==recruiter.getIdRec())
                        {
                    %>
                    <!--start edit -->
                    <div class="w-full lg:w-4/12 px-4 lg:order-3 lg:text-right lg:self-center">
                        <div class="py-6 px-3 mt-32 sm:mt-0">
                            <button onclick="openModal()" class="bg-emerald-500 active:bg-emerald-600 uppercase text-white font-bold hover:shadow-md shadow text-xs px-4 py-2 rounded outline-none focus:outline-none sm:mr-2 mb-1 ease-linear transition-all duration-150" type="button">
                                Edit info
                            </button>
                            <!--debut modal-->
                            <div id="edit-profile" aria-hidden="true"
                                 class="hidden flex overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-4 z-50 justify-center items-center h-modal md:h-full md:inset-0">
                                <div class="relative px-4 w-full max-w-xl h-auto">
                                    <!-- Modal content -->
                                    <div class=" text-left relative rounded-lg shadow bg-gray-700">
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
                                        <form method="post" action="UpdateProfileCan" class="px-6 pb-4 space-y-6 lg:px-8 sm:pb-6 xl:pb-8"
                                              enctype="multipart/form-data">
                                            <h3 class="text-xl font-medium text-white">Update Your Profile :</h3>
                                            <div>
                                                <label for="password"
                                                       class="block mb-2 text-sm font-medium text-gray-300">
                                                    Your Password</label>
                                                <input type="password" name="password" id="password"
                                                       class="border text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 w-full p-2.5 bg-gray-600 border-gray-500 text-white"
                                                       placeholder="Enter new password" required />
                                            </div>
                                            <div>
                                                <label for="location"
                                                       class="block mb-2 text-sm font-medium text-gray-300">
                                                    Your Location</label>
                                                <input type="text" name="location" id="location"
                                                       class="border text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 w-full p-2.5 bg-gray-600 border-gray-500 text-white"
                                                       placeholder="Enter your whereabouts" required />
                                            </div>
                                            <div>
                                                <label for="formation"
                                                       class="block mb-2 text-sm font-medium text-gray-300">
                                                    Your degree</label>
                                                <input type="text" name="formation" id="formation"
                                                       class="border text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 w-full p-2.5 bg-gray-600 border-gray-500 text-white"
                                                       placeholder="Enter your degree or formation" required />
                                            </div>
                                            <div>
                                                <label for="school"
                                                       class="block mb-2 text-sm font-medium text-gray-300">
                                                    Your School</label>
                                                <input type="text" name="school" id="school"
                                                       class="border text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 w-full p-2.5 bg-gray-600 border-gray-500 text-white"
                                                       placeholder="Enter your degree or formation" required />
                                            </div>
                                            <div>
                                                <label for="description"
                                                       class="block mb-2 text-sm font-medium text-gray-300">
                                                    Describe Yourself</label>
                                                <textarea type="text" name="description" id="description"
                                                          class="border text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 w-full p-2.5 bg-gray-600 border-gray-500 text-white"
                                                          placeholder="Tell Us About Yourself" required ></textarea>
                                            </div>
                                            <div>
                                                <label class="block mb-2 text-sm font-medium text-gray-300"
                                                       for="image" >
                                                    Insert Profile Picture
                                                </label>
                                                <input type="file" name="image" id="image" class="block w-full text-sm text-gray-500
                                              file:mr-4 file:py-2 file:px-4
                                              file:rounded-full file:border-0
                                              file:text-sm file:font-semibold
                                              file:bg-green-50 file:text-emerald-700
                                              hover:file:bg-sky-100
                                            " required/>
                                            </div>
                                            <button type="submit"
                                                    class="w-full text-white focus:ring-4  font-medium rounded-lg text-sm px-5 py-2.5 text-center bg-emerald-700 hover:bg-emerald-600 focus:ring-green-700">
                                                Update Profile
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--end edit profile-->
                    <%
                            }
                        }
                    %>
                    <div class=" w-full lg:w-4/12 px-4 lg:order-1">
                    </div>
                </div>

                <div class="text-center mt-12">
                    <h3 class="text-4xl font-semibold leading-normal text-blueGray-700 mb-2">
                        <%=recruiterPrf.getFirstNameRec()%> <%=recruiterPrf.getLastNameRec()%>
                    </h3>
                    <div class="mb-2 text-blueGray-600 mt-10">
                        <i class="fas fa-graduation-cap mr-2 text-lg text-blueGray-400"></i><%=recruiterPrf.getExperienceRec()%> years of experience
                    </div>
                    <div class="mb-2 text-blueGray-600">
                        <i class="fas fa-university mr-2 text-lg text-blueGray-400"></i>Work at : <%=recruiterPrf.getEntrepriseRec()%>
                    </div>
                    <div class="mb-2 text-blueGray-600">
                        <i class="fas fa-venus-mars mr-2 text-lg text-blueGray-400"></i><%=recruiterPrf.getSexeRec()%>
                    </div>
                </div>
                <div class="mt-10 py-10 border-t border-blueGray-200 text-center">
                    <div class="flex flex-wrap justify-center">
                        <div class="w-full lg:w-9/12 px-4">
                            <p class="mb-4 text-lg leading-relaxed text-blueGray-700">
                                <%=recruiterPrf.getDescriptionRec()%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script>
    function openModal(){
        var post_modal=document.getElementById("edit-profile");
        post_modal.classList.remove("hidden");
    };
    function closeModal(){
        var post_modal=document.getElementById("edit-profile");
        post_modal.classList.add("hidden");
    };
</script>
</html>