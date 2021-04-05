const personalForm=document.getElementById('personalForm');
const subjectForm=document.getElementById('subjectForm');
const studentForm=document.getElementById('studentForm');

personalForm.addEventListener('submit',addPersonal);
subjectForm.addEventListener('submit',addSubject);
studentForm.addEventListener('submit',addStudent);
const personalDetails={}
const subjectDetails=[]
const studentDetails={
    "personalDetails":personalDetails,
    "subjectDetails":subjectDetails
}

function addStudent(e)
{
    let Students;
    if(localStorage.getItem('Students')===null){
        Students=[];
    } else{
        Students=JSON.parse(localStorage.getItem('Students'));
    }
    let status=true;
    const NewStudent=JSON.parse(localStorage.getItem('Personal'));

    //Check for unique Student Id...use foreach and check for regNo
    Students.forEach(function(Student,index){
  
        
        if(NewStudent.regNo===Student.personalDetails.regNo){
            console.log('Student ID should be unique....')
            status=false;

        }
    });

    if(status==true)
    {
    studentDetails.personalDetails=NewStudent;
    studentDetails.subjectDetails=subjectDetails;
    console.log(studentDetails);
    Students.push(studentDetails);
    localStorage.setItem('Students',JSON.stringify(Students));
    }
    else
    {
        console.log('Student Details could not be inserted');
    }
    e.preventDefault();
}

function addPersonal(e)
{
    const regNo=document.getElementById('inputRegno').value;
    const name=document.getElementById('inputName').value;
    const email=document.getElementById('inputEmail').value;
    const schoolName=document.getElementById('inputSchoolname').value;
    const city=document.getElementById('inputCity').value;

    const personalDetails={
        "regNo": regNo,
        "name": name,
        "email": email,
        "schoolname": schoolName,
        "city": city
    }
    console.log(personalDetails);
    localStorage.setItem('Personal',JSON.stringify(personalDetails));
    e.preventDefault();
}

function addSubject(e)
{
    const subject=document.getElementById('inputSubject').value;
    const maxMark=document.getElementById('inputMaxMarks').value;
    const scored=document.getElementById('inputScored').value;

    const subjectDetail={
        "subject": subject,
        "maxMark": maxMark,
        "scored": scored
    }

    const tbody=document.getElementById('tbody');
    const tr=document.createElement('tr');
    const slno=tbody.childElementCount
    const percentile=scored/maxMark*100;
    
    const data=`<td>${slno+1}</td><td>${subject}</td><td>${maxMark}</td><td>${scored}</td><td>${percentile}</td>`
    tr.innerHTML=data;
    tbody.appendChild(tr);
    subjectDetails.push(subjectDetail)
    console.log(subjectDetails)
    localStorage.setItem('Subjects',JSON.stringify(subjectDetails));
    e.preventDefault();
}