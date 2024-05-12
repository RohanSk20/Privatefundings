import React from "react"
import './Mainpage.css'
import { useState } from 'react'
import { BrowserRouter as Router, Link, Route, Routes } from 'react-router-dom'; // Import BrowserRouter and Link


const Mainpage =()=>{

    const [adminData, setAdminData] = useState('');
  const [crewData, setcrewData] = useState('');

  const handleAdminInputChange = (event) => {
    setAdminData(event.target.value);
  };
  const handlecrewInputChange = (event) => {
    setcrewData(event.target.value);
  };
  const handleadmin = (event) => {
    event.preventDefault();
    console.log(adminData);
  };

  const handlecrew = (event) => {
    event.preventDefault();
        console.log(crewData);

  };

return <> 

<div className='bg'>
 <nav>
   <img className='logo' src="src/assets/logo.png" alt="" />
   <ul>
   <li><Link to="#">Home</Link></li>
   <li><Link to="#">Contact</Link></li>
     <li><a href="">about</a></li>
   </ul>
   <button className='connect-button'><img src="src/assets/meta2.png" alt="" />Connect</button>
 </nav>
 <div className="content"><h1 className='maintag'>Embark on collaborative finance adventures with friends – effortlessly <br />pool funds for unforgettable trips, events, and more!</h1></div>
<div className="forms">
 <div className="admin">
   <label htmlFor=""><h1 className='crewline'>Register <br /> as Admin</h1></label>
   <form action="">
     <input type="text" required value={adminData} onChange={handleAdminInputChange} id="admin" placeholder='Enter the name'/>
     <button onClick={handleadmin} className='adminbtn'><Link to="/admin">Register</Link></button>
   </form>
 </div>
 <div className="line"></div>
 <div className="crew">
 <label htmlFor=""><h1 className='crewline'>Register <br /> as Crew</h1></label>
 <form action="">
     <input type="text" required onChange={handlecrewInputChange} id="crew" placeholder='Enter the name'/>
     <button onClick={handlecrew} className='crewbtn'>Register</button>

   </form>
 </div>
</div>
</div>
</>
}

export default Mainpage