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
<body>

<%@ include file="includes/Header.jsp" %>
<div class='relative max-w-7xl mx-auto flex justify-center items-center h-[600px]'>
    <div>
        <p class='w-5/6 text-green-700 font-roboto font-bold text-5xl' >Trouvez le profil nécessaire au développement de votre entreprise. </p>

        <div class='mt-6 flex items-center space-x-6'>
            <button
                    class=' font-roboto bg-green-700 text-white rounded-full py-3 px-6 font-bold shadow-md hover:shadow-xl active:scale-95 transition duration-100 ease-in'
            >
                Explorer profils
            </button>
            <button
                    class=' font-roboto  text-green-700 ring-1 ring-green-700 cursor-pointer rounded-full py-3 px-6 font-bold shadow-md hover:shadow-xl active:scale-95 transition duration-100 ease-in'
            >
                Trouver emploi
            </button>
        </div>
    </div>
    <div >
        <img  src="https://images.unsplash.com/photo-1600880292203-757bb62b4baf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
              class='rounded-full w-[800px] h-[460px] object-cover'

        />
    </div>
</div>
<main class=''>
    <section class='max-w-7xl mx-auto  mt-28'>
        <h1 class='font-poppings text-4xl font-bold text-gray-700'>Domaines les plus recherchés</h1>
        <div id="categories" class='w-5/6 mx-auto grid grid-cols-3 mt-10 p-3'>
        </div>
    </section>
    <section class='max-w-5xl mx-auto mt-10 rounded-xl bg-sky-900 h-[650px] flex space-x-3'>
        <img
                src='https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmVzc2lvbmFsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
                class='h-[650px] w-1/2 rounded-l-xl object-cover'
        />
        <div class='flex flex-col  items-start px-5 py-6 w-1/2'>
            <h3 class='text-white font-body text-2xl mt-3 mb-10'>For candidates</h3>
            <h1 class='text-white text-5xl w-1/2 font-body font-bold mb-6'>Find great work</h1>
            <p class='text-white font-body text-xl mb-28'>Make yourself visible to our finest recruiters and take your career to new heightd.</p>
            <div class='grid grid-cols-3 space-x-6 border-t mb-12'>
                <p class='text-white text-md font-body font-semibold mt-3'>Find opportunities for different career fields</p>
                <p class='text-white text-md font-body font-semibold mt-3'>Make yourself shown to recieve rectruiters interests</p>
                <p class='text-white text-md font-body font-semibold mt-3'>Explore different job applications for our candidates</p>
            </div>
            <button
                    class=' font-body bg-white text-sky-900 rounded-full py-2 px-7 font-bold hover:text-sky-700'
            >
                Find opportunities
            </button>
        </div>
    </section>
    <section class='mt-14 bg-teal-50 h-[600px] flex items-center justify-center space-x-36'>
        <div class='flex flex-col items-center space-y-6'>
            <div class=' relative  '>
                <img  src="https://images.unsplash.com/photo-1598257006458-087169a1f08d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVjcnVpdGVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
                      class='rounded-full w-64 h-64 object-cover'

                />
            </div>
            <div class=' flex flex-col text-center items-center'>
                <h1 class='text-4xl text-gray-800 font-bold font-poppings '>Devenir recruteur</h1>
                <button class=' text-white bg-gray-900 px-4 py-2 rounded-lg mt-7 font-niramit'>Explorez des profils</button>
            </div>
        </div>
        <div class='flex flex-col items-center space-y-6'>
            <div class=' relative '>
                <img  src="https://media.istockphoto.com/photos/group-of-candidate-waiting-for-a-job-interview-in-the-office-picture-id1280506989?b=1&k=20&m=1280506989&s=170667a&w=0&h=NOrjN67wEKmGkBwYoGLfwu0DVQPCufvOzSzuqK1lxtg="
                      class='rounded-full w-64 h-64 object-cover'
                />
            </div>
            <div class=' flex flex-col text-center items-center'>
                <h1 class='text-4xl text-gray-800 font-bold font-poppings '>Devenir candidat</h1>
                <button class=' text-white bg-gray-900 px-4 py-2 rounded-lg mt-7 font-niramit'>Postulez votre candidature</button>
            </div>
        </div>
    </section>
    <section class='max-w-5xl mx-auto mt-10 h-[650px] flex space-x-3'>
        <div class='flex flex-col bg-sky-50 w-3/5 items-start rounded-xl px-5 py-6'>
            <p class='text-white font-body text-xl mb-28'>Make yourself visible to our finest recruiters and take your career to new heightd.</p>
            <div class='grid grid-cols-3 space-x-6 border-t mb-12'>
                <p class='text-white text-md font-body font-semibold mt-3'>Find opportunities for different career fields</p>
                <p class='text-white text-md font-body font-semibold mt-3'>Make yourself shown to recieve rectruiters interests</p>
                <p class='text-white text-md font-body font-semibold mt-3'>Explore different job applications for our candidates</p>
            </div>
        </div>
        <div class='flex flex-col bg-green-600 items-start rounded-xl px-5 py-6 w-2/5'>
            <h3 class='text-white font-body text-2xl mt-3 mb-10'>For candidates</h3>
            <h1 class='text-white text-5xl w-1/2 font-body font-bold mb-6'>Find great work</h1>
            <p class='text-white font-body text-xl mb-28'>Make yourself visible to our finest recruiters and take your career to new heightd.</p>
            <div class='grid grid-cols-3 space-x-6 border-t mb-12'>
                <p class='text-white text-md font-body font-semibold mt-3'>Find opportunities for different career fields</p>
                <p class='text-white text-md font-body font-semibold mt-3'>Make yourself shown to recieve rectruiters interests</p>
                <p class='text-white text-md font-body font-semibold mt-3'>Explore different job applications for our candidates</p>
            </div>
        </div>
    </section>
</main>
<%@ include file="includes/Footer.jsp" %>
</body>
<script type="text/javascript" src="script/script.js" >
</script>
</html>