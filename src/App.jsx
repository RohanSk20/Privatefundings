import { useState } from 'react'
import AdminPage from './components/admin/Adminpage';
import './App.css'
import CrewPage from './components/crew/Crewpage';
import Mainpage from './components/Mainpage/Mainpage';
import {BrowserRouter as Router, Link, Routes, Route} from 'react-router-dom'; // Import BrowserRouter and Link

function App() {

  return (
    <>
   <Router>
    <Routes>
      <Route path="/" element={<Mainpage/>} />
      <Route path="/admin" element={<AdminPage/>} />
      <Route path="/crew" element={<CrewPage/>} />
    </Routes>
   </Router>
   
    </>
  )
}

export default App

