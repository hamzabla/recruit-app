
const categories = [
    {
        id: 1,
        img: "https://images.unsplash.com/photo-1610563166150-b34df4f3bcd6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29tcHV0ZXIlMjBzY2llbmNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        name: "Computer Science"
    },
    {
        id: 2,
        img: "https://media.istockphoto.com/photos/japanese-architects-at-a-casual-office-meeting-picture-id1275745944?b=1&k=20&m=1275745944&s=170667a&w=0&h=guyH6AbgGW1nMmoxH21__auDp0_Eu07HX7l2PgzBR2E=",
        name: "Architecture"
    },
    {
        id: 3,
        img: "https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YnVzaW5lc3MlMjBtYW5hZ2VtZW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        name: "Buisiness & Management"
    },
    {
        id: 4,
        img: "https://images.unsplash.com/photo-1617155093730-a8bf47be792d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGJpb2xvZ3l8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
        name: "Biology & Life Siences"
    },
    {
        id: 5,
        img: "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWVkaWNpbmV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
        name: "Medicine"
    },
    {
        id: 6,
        img: "https://images.unsplash.com/photo-1572044162444-ad60f128bdea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZGVzaWduaW5nfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
        name: "Design"
     }
];

// {
//     id: 5,
//         img: "https://media.istockphoto.com/photos/putting-in-the-dedication-to-build-her-dreams-picture-id1298550035?b=1&k=20&m=1298550035&s=170667a&w=0&h=xQmu1P5uZB3sNuqjM2CfVjLhrWhijYvy4C2v_W2wfSk=",
//     name: "Engineering"
// },
const categories1 = categories.map(iterate);
function iterate(value, index, array) {
    let x = `<div class='cursor-pointer h-60 w-80 flex flex-col justify-center items-center rounded-lg mb-8 hover:shadow-xl  ring-1 ring-gray-300 ' >
                <div class='relative '>
                    <img 
                        src=${value.img}
                        class='rounded-t-lg h-48 w-80 hover:opacity-80'
                    />
                </div>
                <div>
                    <h3 class='font-bold text-center py-2 bg-white h-12 text-lg font-poppings rounded-b-lg '>${value.name}</h3>
                </div>
            </div>`;
    document.getElementById("categories").innerHTML+=x;
}

