document.getElementById('togglePassword').addEventListener('click',function()
{
    var password = document.getElementById('password');
    var icons = this.querySelector('i');
    if(password.type === 'password')
    {
        password.type = 'text';
        icons.classList.remove('fa-lock');
        icons.classList.add('fa-unlock');
    }
    else
    {
        password.type = 'password';
        icons.classList.remove('fa-unlock');
        icons.classList.add('fa-lock');
    }
});