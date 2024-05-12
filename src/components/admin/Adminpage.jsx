import React from 'react';
import './Adminpage.css'
function AdminPage() {


  return (
    <div className='bg'>
      <nav>
        <img className='logo' src="src/assets/logo.png" alt="" />
        <div className="searchsection">
          <form action="">
            <input className="search" type="text" placeholder='Search for funds' />
            <button className="searchbtn"><img src="https://www.freeiconspng.com/thumbs/search-icon-png/search-icon-png-5.png" alt="" />Search</button>
          </form>
        </div>
      </nav>
<div className="container">
  <h2>Funds Joined</h2>
  <form action=""></form>
</div>

    </div>
  );
}

export default AdminPage;
