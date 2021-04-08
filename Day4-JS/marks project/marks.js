
document.getElementById('marks-form').addEventListener('submit',function(e){

    document.getElementById('results').style.display='none';//to hide
    document.getElementById('loading').style.display='block';//to display
    setTimeout(calculateResults,1000);
    e.preventDefault();
});

function calculateResults(){
    const tenglish=document.getElementById('tenglish');    
    const english=document.getElementById('english');
    english.value=parseFloat(tenglish.value);

    const tmaths=document.getElementById('tmaths');
    const maths=document.getElementById('maths');
    maths.value=parseFloat(tmaths.value);
    const tphysics=document.getElementById('tphysics');
    const pphysics=document.getElementById('pphysics');
    const physics=document.getElementById('physics');
    physics.value=parseFloat(tphysics.value)+parseFloat(pphysics.value);

    const tchemistry=document.getElementById('tchemistry');
    const pchemistry=document.getElementById('pchemistry');
    const chemistry=document.getElementById('chemistry');
    chemistry.value=parseFloat(tchemistry.value)+parseFloat(pchemistry.value);

    const tbiology=document.getElementById('tbiology');
    const pbiology=document.getElementById('pbiology');
    const biology=document.getElementById('biology');
    biology.value=parseFloat(tbiology.value)+parseFloat(pbiology.value);

    console.log(english.value + maths.value + physics.value + chemistry.value + biology.value);
    var total=parseFloat(english.value) +parseFloat(maths.value) +parseFloat(physics.value) + parseFloat(chemistry.value) + parseFloat(biology.value);
    const average=parseFloat(total/5);
    
    const totalmarks=document.getElementById('totalmarks');
    const percentage=document.getElementById('percentage');
    const admission=document.getElementById('admission-status');
    totalmarks.value=total;
    percentage.value=average.toFixed(2);
    if(average>80){
       
        document.getElementById('results').style.display='block';//to display results
        document.getElementById('loading').style.display='none';//hiding the loading image
        admission.value="You are eligible to join College"
    }
    else{
        showError('Sorry....You are not eligible for admissions in college ');
    //  document.getElementById('results').style.display='block';//to display results
    //  document.getElementById('loading').style.display='none';//hiding the loading image
    //  admission.className='alert alert-danger';
    //  admission.value="You are not eligible to join College"
    }
}
function showError(error){
    document.getElementById('results').style.display='none';
    document.getElementById('loading').style.display='none';
    const errorDiv=document.createElement('div');
    const card=document.querySelector('.card');
    const heading=document.querySelector('.heading');
    errorDiv.className='alert alert-danger';
    errorDiv.appendChild(document.createTextNode(error));
    card.insertBefore(errorDiv,heading);
    setTimeout(clearError,5000);

}
function clearError()
{
    document.querySelector('.alert').remove();
}