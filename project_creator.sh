#!/bin/bash

# pass in project name and see if can pass into the question asked in next command
# npm create vite@latest
# this will ask for project name
# cd into project folder name
# npm install

# Remove files
    # Remove App.css
    # Remove reference from App.tsx
    # Remove code from within the return statement and leave word being app name

    # Remove all code from index.css

    # Create pages folder

    # Create lib folder
        # types.ts
        # constants.ts
        # helpers.ts
    
    # add src/components folder

# Install tailwind
    # https://tailwindcss.com/docs/guides/vite
    # npm install -D tailwindcss postcss autoprefixer
    # npx tailwindcss init
    # Replace tailwind file with this
        # /** @type {import('tailwindcss').Config} */
        # export default {
        # content: [
        #     "./index.html",
        #     "./src/**/*.{js,ts,jsx,tsx}",
        # ],
        # theme: {
        #     extend: {},
        # },
        # plugins: [],
        # }
    # Add the following to input.css
        # @tailwind base;
        # @tailwind components;
        # @tailwind utilities;

# Install react router
    # npm install react-router-dom

    # Add basic router to App.tsx

        # import { BrowserRouter, NavLink, Route, Router, Routes } from "react-router-dom"
        # import { HomePage } from "./pages/HomePage"
        # import { EntrezPage } from "./pages/EntrezPage"
        # import { EntrezSearch } from "./components/EntrezSearch"

        # function App() {
        #   return (
        #     <>
        #       <BrowserRouter>
        #         <nav className="flex justify-evenly w-full border-b">
        #           <NavLink to="/" className="bg-red-200 w-full text-center hover:bg-red-300 p-1">Home</NavLink>
        #           <NavLink to="/entrez" className="bg-red-200 w-full text-center hover:bg-red-300 p-1">Real Game</NavLink>
        #         </nav>
        #         <Routes>
        #           <Route path="/" element={<HomePage />} />
        #           <Route path="entrez"  element={<EntrezPage />}>
        #               {/* <Route path="" element={<EntrezInfo />} /> */}
        #               <Route path="search" element={<EntrezSearch />}/>
        #           </Route>
        #         </Routes>
        #       </BrowserRouter>
        #     </>
        #   )
        # }

        # export default App
                                                                                                                            
# react-query
    # npm i @tanstack/react-query
    
    # Wrap main.tsx with QueryProvider

        # import React from 'react'
        # import ReactDOM from 'react-dom/client'
        # import App from './App.tsx'
        # import './index.css'
        # import { QueryClient, QueryClientProvider } from '@tanstack/react-query'

        # const queryClient = new QueryClient();

        # ReactDOM.createRoot(document.getElementById('root')!).render(
        #   <React.StrictMode>
        #     <QueryClientProvider client={queryClient}>
        #       <App />
        #     </QueryClientProvider>
        #   </React.StrictMode>,
        # )


# Install axios
    # npm install axios
    # Create api folder

# Install Modal
    # add Modal.tsx file with

        #     import ReactDOM from 'react-dom';
        # import { useEffect, useRef } from 'react';
        # import React from 'react';
        # import { ModalProps }  from '../lib/types';
        # import { IoIosCloseCircle } from "react-icons/io";

        # type ModalProps = {
        #     setShowModal: any, 
        #     children: any, 
        #     actionBar: any, 
        #     classes: string, 
        #     childClasses: string
        # }
        # const Modal: React.FC<ModalProps> = ({ setShowModal, children, classes, childClasses }) => {
        #     const modal = useRef(document.createElement('div'))
        #     useEffect(()=>{
        #         const root = document.querySelector('.modal');
        #         // document.body.classList.add('overflow-hidden');
        #         root?.appendChild(modal.current)
            
        #         // When modal being removed, need to remove the class
        #         return ()=>{
        #             // document.body.classList.remove('overflow-hidden');
        #             root?.removeChild(modal.current)
        #         }
        #     }, [])
            
        #     const handleModalClose = () => {
        #         setShowModal(false);
        #     }

        #     return ReactDOM.createPortal(
        #         <div data-testid="modal" className='fixed flex left-0 top-0 h-full w-full justify-center items-center'>
        #             <div className="fixed bg-gray-400 opacity-80 h-full w-full" onClick={handleModalClose}></div>
        #             <div className={`w-fit h-fit rounded-3xl z-[1] ${classes} relative`}>
        #                 <div className={`absolute right-1 top-0`}>
        #                     <button className='modalButton text-2xl mt-1' onClick={handleModalClose}><IoIosCloseCircle /></button>
        #                 </div>
        #                 <div className={`flex flex-col justify-between h-fit ${childClasses}`}>
        #                     {children}
        #                 </div>
        #             </div>
        #         </div>,
                
        #         modal.current
        #     )
        # }

        # export default Modal;


    # Add modal element to index.html
        # <div class="modal"></div>

    # Call the modal in main page
        # import { useState } from "react";
        # import Modal from "../components/Modal";

        # export const HomePage = () => {
        #     const [showModal, setShowModal] = useState(false);
            
        #     let actionBar = <div><button>action button</button></div>

        #     let modal = <Modal 
        #     classes="bg-white px-2" 
        #     childClasses="" 
        #     className="z-[0]" 
        #     setShowModal={setShowModal} 
        #     actionBar={actionBar}>
        #         <div className="w-200 h-200">Place Modal Data Here</div>
        #     </Modal>;

        #     return (
        #         <>
        #             <div>Home</div>
        #             <button onClick={()=>setShowModal(true)}>Show Modal</button>
        #             {showModal && modal}
        #         </>
        #     )
        # }
