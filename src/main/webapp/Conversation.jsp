<%@ page import="com.app.models.Recruiter" %>
<%@ page import="com.app.models.Candidate" %><%--
  Created by IntelliJ IDEA.
  User: najiy
  Date: 1/24/2022
  Time: 11:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Niramit:ital,wght@0,300;0,400;0,600;0,700;1,300&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700&display=swap" rel="stylesheet"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style/css/all.min.css" >
    <meta charset="utf-8">
    <title>Talk to know more!</title>
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
<%
    Recruiter recruiter = (Recruiter) session.getAttribute("recruiter");
    Candidate candidate = (Candidate) session.getAttribute("candidate");
    String user=null;
    if (recruiter != null) {
        user="recruiter";
    }else if(candidate!=null){
        user="candidate";
    }
%>
<body class="flex justify-center w-screen min-h-screen bg-gray-100 text-gray-800 p-10">
<div class="flex flex-col w-72 bg-white shadow-xl rounded-lg overflow-hidden py-5">
    <div class="ml-6 font-bold text-2xl">Chats</div>
    <div id="user" class="hidden"><%=user%></div>
    <div class="mt-4 flex flex-col space-y-2 flex-grow h-0 p-4 overflow-auto">
        <button
                class="flex flex-row items-center hover:bg-gray-100 rounded-xl px-4 py-3"
        >
            <div
                    class="flex items-center justify-center h-8 w-8 bg-indigo-200 rounded-full"
            >
                Y
            </div>
            <div class="ml-2 text-sm font-semibold">Youness Naji</div>
        </button>
        <button
                class="flex flex-row items-center hover:bg-gray-100 rounded-xl px-4 py-3"
        >
            <div
                    class="flex items-center justify-center h-8 w-8 bg-gray-200 rounded-full"
            >
                H
            </div>
            <div class="ml-2 text-sm font-semibold">Hamza Bessa</div>

        </button>

    </div>
</div>
<!-- Component Start -->
<div class="ml-4 flex flex-col flex-grow w-full max-w-4xl bg-white shadow-xl rounded-lg overflow-hidden">
    <div id="history" class="flex flex-col flex-grow h-0 p-4 overflow-auto">
        <div class="flex w-full mt-2 space-x-3 max-w-xs">
            <div class="flex-shrink-0 h-10 w-10 rounded-full bg-gray-300"></div>
            <div>
                <div class="bg-gray-300 p-3 rounded-r-lg rounded-bl-lg">
                    <p class="text-sm">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
                <span class="text-xs text-gray-500 leading-none">2 min ago</span>
            </div>
        </div>
        <div class="flex w-full mt-2 space-x-3 max-w-xs ml-auto justify-end">
            <div>
                <div class="bg-blue-600 text-white p-3 rounded-l-lg rounded-br-lg">
                    <p class="text-sm">Lorem ipsum dolor sit amet.</p>
                </div>
                <span class="text-xs text-gray-500 leading-none">2 min ago</span>
            </div>
            <div class="flex-shrink-0 h-10 w-10 rounded-full bg-gray-300"></div>
        </div>
        <div class="flex w-full mt-2 space-x-3 max-w-xs">
            <div class="flex-shrink-0 h-10 w-10 rounded-full bg-gray-300"></div>
            <div>
                <div class="bg-gray-300 p-3 rounded-r-lg rounded-bl-lg">
                    <p class="text-sm">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                </div>
                <span class="text-xs text-gray-500 leading-none">2 min ago</span>
            </div>
        </div>
        <div class="flex w-full mt-2 space-x-3 max-w-xs ml-auto justify-end">
            <div>
                <div class="bg-blue-600 text-white p-3 rounded-l-lg rounded-br-lg">
                    <p class="text-sm">Lorem ipsum dolor sit amet.</p>
                </div>
                <span class="text-xs text-gray-500 leading-none">2 min ago</span>
            </div>
            <div class="flex-shrink-0 h-10 w-10 rounded-full bg-gray-300"></div>
        </div>
        <div class="flex w-full mt-2 space-x-3 max-w-xs">
            <div class="flex-shrink-0 h-10 w-10 rounded-full bg-gray-300"></div>
            <div>
                <div class="bg-gray-300 p-3 rounded-r-lg rounded-bl-lg">
                    <p class="text-sm">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                </div>
                <span class="text-xs text-gray-500 leading-none">2 min ago</span>
            </div>
        </div>
        <div class="flex w-full mt-2 space-x-3 max-w-xs ml-auto justify-end">
            <div>
                <div class="bg-blue-600 text-white p-3 rounded-l-lg rounded-br-lg">
                    <p class="text-sm">Lorem ipsum dolor sit.</p>
                </div>
                <span class="text-xs text-gray-500 leading-none">2 min ago</span>
            </div>
            <div class="flex-shrink-0 h-10 w-10 rounded-full bg-gray-300"></div>
        </div>
    </div>

    <div class="bg-gray-300 p-4 flex flex-row items-center justify-around">
        <input id="txtMessage" class="flex items-center h-10 w-5/6 rounded-full px-4 text-sm" type="text"
               placeholder="Type your message…">
        <button
                class="flex items-center h-10 justify-center bg-indigo-500 hover:bg-indigo-600 rounded-full text-white px-4 py-1 flex-shrink-0"
                id="btnSend"
        >
            <span>Send</span>
            <span class="ml-2">
          <svg
                  class="w-4 h-4 transform rotate-45 -mt-px"
                  fill="none"
                  stroke="currentColor"
                  viewBox="0 0 24 24"
                  xmlns="http://www.w3.org/2000/svg"
          >
            <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"
            ></path>
          </svg>
        </span>
        </button>
    </div>
</div>
<!-- Component End  -->

</body>
<script>
    window.addEventListener( "load", function( event ) {
        let pseudo = prompt( "Veuillez saisir votre pseudo :" );
        let ws = new WebSocket( "ws://localhost:8080/Conversation/" + pseudo );
        let user= document.getElementById("user").innerText;
        console.log(user);
        let txtHistory = document.getElementById( "history" );
        let txtMessage = document.getElementById( "txtMessage" );
        txtMessage.focus();
        ws.addEventListener( "open", function( evt ) {
            console.log( "Connection established" );
        });
        ws.addEventListener( "message", function( evt ) {
            let message = evt.data;
            console.log( "Receive new message: " + message );
            txtHistory.innerHTML += message;
        });
        ws.addEventListener( "close", function( evt ) {
            console.log( "Connection closed" );
        });
        let btnSend = document.getElementById( "btnSend" );
        btnSend.addEventListener( "click", function( clickEvent ) {
            ws.send(txtMessage.value + "/"+ user);
            txtMessage.value = "";
            txtMessage.focus();
        });
        let btnClose = document.getElementById( "btnClose" );
        btnClose.addEventListener( "click", function( clickEvent ) {
            ws.close();
        });
    });
</script>
</html>