<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.List" %>
<%@ page import="com.app.models.Category" %>
<%@ page import="com.app.dao.CandidateDAO" %>
<%@ page import="com.app.controllers.DaoInstance" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.app.models.Post" %>
<%@ page import="java.nio.file.Paths" %>
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
<div class="max-w-8xl mx-auto flex items-start justify-center">
    <div class="h-[800px] block my-4 ml-4 rounded-2xl shadow-lg relative w-80">
        <div class="bg-white h-full rounded-2xl ">
            <div class=" pt-6 px-6">
                <a href="#" class=" group block">
                    <div class="flex items-center">
                        <% if(recruiter!=null){
                        %>
                        <div>
                            <img class="inline-block h-12 w-12 rounded-full"
                                 src="https://pbs.twimg.com/profile_images/1254779846615420930/7I4kP65u_400x400.jpg" >
                        </div>
                        <div class="ml-3">
                            <p class="text-base leading-6 font-medium text-gray-800">
                                <% out.println(recruiter.getFirstNameRec() + " " + recruiter.getLastNameRec()); %>
                            </p>
                            <p class="text-sm leading-5 text-left font-medium text-gray-500">
                                @Recruiter
                            </p>
                        </div>
                        <% } %>
                        <% if(candidate!=null){
                        %>
                        <div>
                            <img class="inline-block h-12 w-12 rounded-full"
                                 src="https://pbs.twimg.com/profile_images/1254779846615420930/7I4kP65u_400x400.jpg" >
                        </div>
                        <div class="ml-3">
                            <p class="text-base leading-6 font-medium text-gray-800">
                                <% out.println(candidate.getFirstNameCan() + " " + candidate.getLastNameCan()); %>
                            </p>
                            <p class="text-sm leading-5 text-left font-medium text-gray-500">
                                @Candidate
                            </p>
                        </div>
                        <% } %>
                    </div>
                </a>
            </div>
            <nav class="mt-6">
                <div>
                    <a class="w-full uppercase text-emerald-600 flex items-center p-4 my-2 transition-colors duration-200 justify-start bg-gradient-to-r from-white to-emerald-100 border-r-4 border-emerald-500" href="#">
                          <span class="text-left">
                              <svg xmlns="http://www.w3.org/2000/svg" class="h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                              </svg>
                          </span>
                        <span class="mx-4 text-sm font-normal">
                              Dashboard
                          </span>
                    </a>
                    <% if(candidate!=null){%>
                    <a onclick="openModal()"
                       class="w-full uppercase text-gray-500 flex items-center p-4 my-2 transition-colors duration-200 justify-start hover:text-blue-500" href="#">
                          <span class="text-left">
                              <svg xmlns="http://www.w3.org/2000/svg" class="h-6" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd" />
                              </svg>
                          </span>
                        <span class="mx-4 text-sm font-normal">
                              Add Candidature
                          </span>
                    </a>
                    <%}%>
                    <a class="w-full uppercase text-gray-500 flex items-center p-4 my-2 transition-colors duration-200 justify-start hover:text-blue-500" href="#">
                          <span class="text-left">
                              <svg xmlns="http://www.w3.org/2000/svg" class="h-6" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z" clip-rule="evenodd" />
                              </svg>
                          </span>
                        <span class="mx-4 text-sm font-normal">
                              Profile
                          </span>
                    </a>
                    <a class="w-full uppercase text-gray-500 flex items-center p-4 my-2 transition-colors duration-200 justify-start hover:text-blue-500" href="#">
                          <span class="text-left">
                              <svg xmlns="http://www.w3.org/2000/svg" class="h-6" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M17.707 9.293a1 1 0 010 1.414l-7 7a1 1 0 01-1.414 0l-7-7A.997.997 0 012 10V5a3 3 0 013-3h5c.256 0 .512.098.707.293l7 7zM5 6a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd" />
                              </svg>
                          </span>
                        <span class="mx-4 text-sm font-normal">
                              Categories
                          </span>
                    </a>
                    <a class="w-full uppercase text-gray-500 flex items-center p-4 my-2 transition-colors duration-200 justify-start hover:text-blue-500" href="#">
                          <span class="text-left">
                              <svg xmlns="http://www.w3.org/2000/svg" class="h-6" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd" d="M17.707 9.293a1 1 0 010 1.414l-7 7a1 1 0 01-1.414 0l-7-7A.997.997 0 012 10V5a3 3 0 013-3h5c.256 0 .512.098.707.293l7 7zM5 6a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd" />
                              </svg>
                          </span>
                        <span class="mx-4 text-sm font-normal">
                              Conversations
                          </span>
                    </a>
                </div>
            </nav>
        </div>
    </div>

    <%--Start of Add post modal --%>
    <%
        List <Category> categoryList = (List<Category>) session.getAttribute("categoryList");
        if (candidate!=null){
    %>
    <div id="add-post" aria-hidden="true"
         class="hidden flex overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-4 z-50 justify-center items-center h-modal md:h-full md:inset-0">
        <div class="relative px-4 w-full max-w-xl h-full md:h-auto">
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
                <form method="post" action="AddPost" class="px-6 pb-4 space-y-6 lg:px-8 sm:pb-6 xl:pb-8"
                      enctype="multipart/form-data">
                    <h3 class="text-xl font-medium text-white">Add your candidature post :</h3>
                    <div>
                        <label for="post"
                               class="block mb-2 text-sm font-medium text-gray-300">
                            Describe Yourself</label>
                        <textarea type="text" name="post" id="post"
                                  class="border text-sm rounded-lg focus:ring-emerald-500 focus:border-emerald-500 w-full p-2.5 bg-gray-600 border-gray-500 text-white"
                                  placeholder="Tell Us About Yourself" required ></textarea>
                    </div>
                    <div>
                        <label for="category" class="block mb-2 text-sm font-medium text-gray-400">
                            Select your category
                        </label>
                        <select id="category"
                                name="category"
                                class=" border text-sm rounded-lg block w-full p-2.5 bg-gray-700 border-gray-600 placeholder-gray-400 text-white focus:ring-blue-500 focus:border-blue-500"
                        >
                            <option value="" selected>Choose your category</option>
                            <%
                                if (categoryList!=null){
                                    for(int i=0;i<categoryList.size();i++){
                            %>
                            <option value="<%=categoryList.get(i).getIdCategory()%>" ><%=categoryList.get(i).getCategory()%></option>
                            <%
                                    } }
                            %>

                        </select>
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

                    <input type="hidden" name="idCandidate"
                           value=<%=candidate.getIdCan()%>
                    >

                    <button type="submit"
                            class="w-full text-white focus:ring-4  font-medium rounded-lg text-sm px-5 py-2.5 text-center bg-emerald-700 hover:bg-emerald-600 focus:ring-green-700">
                        Post Your Candidature
                    </button>
                </form>
            </div>
        </div>
    </div>
    <%
        }
    %>
    <%--End of Add post modal --%>

    <%--Start of candidate posts --%>
    <%
        List <Post> postListAll = (List<Post>) session.getAttribute("postList");
        List <Post> postListByCategory = (List<Post>) session.getAttribute("postListByCategory");
        List <Post> postList = (postListByCategory==null) ? postListAll : postListByCategory;
        if (postList!=null){
            int i=  (int) session.getAttribute("numPost");
    %>
    <div class="flex flex-col items-center w-3/4 mr-4 h-[800px]">
        <div class="flex bg-white my-4 ml-4 w-full rounded-2xl shadow-lg" style="height:650px;">
            <div class="w-10">
                <%
                    if(i>0){
                %>
                <a href="GetAllPost?numPost=<%=i-1%>">
                    <button
                            class="relative left-2 top-1/2 bg-gray-300 text-gray-600 disabled:text-gray-400 rounded-full w-10 h-10 flex justify-center items-center shadow-md z-50">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-7" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
                        </svg>
                    </button>
                </a>
                <%
                }else{
                %>
                <button disabled
                        class="relative left-2 top-1/2 bg-gray-300 text-gray-600 disabled:text-gray-400 rounded-full w-10 h-10 flex justify-center items-center shadow-md z-50">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-7" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
                    </svg>
                </button>
                <%
                    }
                %>
            </div>
            <div class="flex flex-col items-start mt-5 text-center lg:text-left px-8 md:px-12 lg:w-1/2 ">
                <div class=" flex w-full border-b-2 border-gray-300 py-3">
                    <a href="GetProfileCand?idCandidat=<%=postList.get(i).getIdCandidat()%>"  class="group block">
                        <div class="flex items-center">
                            <div>
                                <img class="inline-block h-12 w-12 rounded-full" src="https://pbs.twimg.com/profile_images/1254779846615420930/7I4kP65u_400x400.jpg" alt="">
                            </div>
                            <div class="ml-3">
                                <p class="text-base leading-6 font-medium text-gray-800">
                                    <%=postList.get(i).getFirstnameCand()%> <%=postList.get(i).getLastnameCand()%>
                                </p>
                                <p class="text-sm leading-5 text-left font-medium text-gray-500">
                                    @Candidate
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
                <h2 class="mt-20 text-3xl font-semibold text-gray-800 md:text-4xl">Get To Know
                    <span class="text-emerald-600">Me.</span>
                </h2>
                <p class="mt-8 text-sm text-gray-500 md:text-base">
                    <%=postList.get(i).getPost()%>
                </p>
            </div>
            <div class="hidden lg:block lg:w-1/2 bg-stone-200" style="clip-path:polygon(10% 0, 100% 0%, 100% 100%, 0 100%)">
                <div class="h-full object-cover -mt-20 ml-40 z-10" >
                    <iframe width="400" height="600" frameborder="0"
                            src="<%="videos/" + Paths.get(postList.get(i).getVideo()).getFileName().toString()%>"
                            allow="accelerometer; encrypted-media; gyroscope; picture-in-picture" allowfullscreen >
                    </iframe>
                </div>
            </div>
            <div class="w-10 bg-stone-200 rounded-r-2xl">
                <%
                    if(i<postList.size()-1){
                %>
                <a href="GetAllPost?numPost=<%=i+1%>">
                    <button
                            class="relative right-2 top-1/2 bg-gray-300 text-gray-600 disabled:text-gray-400 rounded-full w-10 h-10 flex justify-center items-center shadow-md z-50">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-7" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                        </svg>
                    </button>
                </a>
                <%
                }else{
                %>
                <button disabled
                        class="relative right-2 top-1/2 bg-gray-300 text-gray-600 disabled:text-gray-400 rounded-full w-10 h-10 flex justify-center items-center shadow-md z-50">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-7" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                    </svg>
                </button>
                <%
                    }
                %>
            </div>
        </div>
        <%--Start of evaluation zone for recruiter--%>
        <% if(recruiter!=null){ %>
        <div class="flex flex-col bg-white ml-4 w-full rounded-2xl shadow-lg  text-center py-8 px-8 md:px-12 ">
            <h2 class="text-2xl font-semibold text-gray-800 md:text-3xl">Did You Find This Profile <span class="text-emerald-600">Interesting?</span></h2>
            <div class="flex justify-around mt-6">
                <a class=" bg-green-500 h-12 w-12 flex items-center justify-center text-white  rounded-full hover:bg-green-400" href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-9" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M6.267 3.455a3.066 3.066 0 001.745-.723 3.066 3.066 0 013.976 0 3.066 3.066 0 001.745.723 3.066 3.066 0 012.812 2.812c.051.643.304 1.254.723 1.745a3.066 3.066 0 010 3.976 3.066 3.066 0 00-.723 1.745 3.066 3.066 0 01-2.812 2.812 3.066 3.066 0 00-1.745.723 3.066 3.066 0 01-3.976 0 3.066 3.066 0 00-1.745-.723 3.066 3.066 0 01-2.812-2.812 3.066 3.066 0 00-.723-1.745 3.066 3.066 0 010-3.976 3.066 3.066 0 00.723-1.745 3.066 3.066 0 012.812-2.812zm7.44 5.252a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                    </svg>
                </a>
                <a class=" bg-yellow-500 h-12 w-12 flex items-center justify-center text-white rounded-full hover:bg-yellow-400" href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-9 " viewBox="0 0 20 20" fill="currentColor">
                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                    </svg>
                </a>
                <a class=" bg-red-500 h-12 w-12 flex items-center justify-center text-white  rounded-full hover:bg-red-400" href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-9" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                    </svg>
                </a>
            </div>
        </div>
        <% } %>

        <%--End of evaluation zone for recruiter--%>
    </div>
    <%
        }
    %>
    <%--End of candidate posts--%>
</div>
<%@ include file="includes/Footer.jsp" %>
</body>

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