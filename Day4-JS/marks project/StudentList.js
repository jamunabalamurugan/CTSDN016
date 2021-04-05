const acceptStudent=document.querySelector('#addStudent')
const displayStudents=document.getElementById('displayStudents')
const tbody=document.getElementById('tblStudentRows');
   
loadEventListeners();
function loadEventListeners()
{
    console.log(document)
   
document.addEventListener('mousemove',getStudents);
acceptStudent.addEventListener('click',callAddStudent)
displayStudents.addEventListener('click',getStudents)

}
function getStudents(e){
    
    while(tbody.firstChild){
        tbody.removeChild(tbody.firstChild);
    }


    let Students;
   
    if(localStorage.getItem('Students')===null){
        Students=[];
    } else{
      
        Students=JSON.parse(localStorage.getItem('Students'));
    }
 
    Students.forEach(function(Student){
     
    const tr=document.createElement('tr');
    const slno=tbody.childElementCount
    const data=`<td>${Student.personalDetails.regNo}</td><td>${Student.personalDetails.name}</td><td>${Student.personalDetails.schoolname}</td> 
    <td>
        <button class="btn btn-secondary">View</button>
        <button class="btn btn-primary" >Edit</button>
        <button class="delete-item btn btn-danger" onclick=removeStudent(this)>Delete</button>
    </td>`

         tr.innerHTML=data;
         
         tbody.appendChild(tr);

    });
    e.preventDefault();
}

function callAddStudent(e)
{
    
    window.location.replace("../MarksCalculator/AddStudentMarkSheet.html");
     

}

function removeStudent(thisrecord){
    
    
    thisrecord.parentElement.parentElement.remove();
    removeStudentfromLS(thisrecord.parentElement.parentElement);
   
}

function removeStudentfromLS(StudentItem){
    let Students;
    if(localStorage.getItem('Students')===null){
        Students=[];
    }else{
        Students=JSON.parse(localStorage.getItem('Students'));
    }

    Students.forEach(function(Student,index){
        
       
        if(StudentItem.textContent.indexOf(Student.personalDetails.regNo)==0){
            console.log('Deleting from LS....')
            Students.splice(index,1);

        }
    });
    localStorage.setItem('Students',JSON.stringify(Students));
}

function ViewStudentsByName(thisrecord){
    
    
    const text=thisrecord.parentElement.parentElement.name;
    console.log(text)
    document.querySelectorAll('.collection-item').forEach(function(Student){
      const item=Student.firstChild.textContent;
      if(item.toLowerCase().indexOf(text) != 1){
          Student.style.display='block';
      }  else{
          Student.style.display='none';
      }
    });
}

