import Head from 'next/head'
import { useState } from 'react';
import { useRouter } from 'next/router'; // useRouter 추가


export default function Login() {
    const [id, setId] = useState('');
    const [password, setPassword] = useState('');
    const [signup, setsignUp] = useState(false);
    const router = useRouter(); 

    const handleIdChange = (e) => {
        setId(e.target.value);
    };
    const handlePasswordChange = (e) => {
        setPassword(e.target.value);
    };
    const handleLoginSubmit = (e) => {
        e.preventDefault();
        console.log(`Id: ${id}, Password: ${password}`);
        // 여기서 로그인 성공 시 다른 곳으로 이동 (예: '/dashboard'로 이동)
        // router.push('/dashboard');
    };
    const handleSignupSubmit = (e) => {
        e.preventDefault();
        setsignUp(true);
        // signup이 true일 때, signup 폴더에 있는 index 페이지로 이동
        if (signup) {
            router.push('/signup');
        }
    }

    return (
        <div className='login-container'>
            <Head>
                <title>Login</title>
        </Head>
            
            <h2>Log in</h2>
            <form onSubmit={handleLoginSubmit} className='login-form-wrapper'>
                    <input
                        type="id"
                        id="id"
                        value={id}
                        onChange={handleIdChange}
                        placeholder='id'
                    />
                    <input
                        type="password"
                        id="password"
                        value={password}
                        onChange={handlePasswordChange}
                        placeholder='password'
                    />
                <input type="submit" value="Login"/>
            </form>
            <form onSubmit={handleSignupSubmit}>
                <button type="submit">Sign up</button>
            </form>
        </div>
    );
}
