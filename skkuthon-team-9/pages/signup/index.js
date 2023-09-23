import Head from 'next/head';
import { useState } from 'react';

export default function SignUp() {
    const [name, setName] = useState('');
    const [jumin, setJumin] = useState('');
    const [hidden, setHidden] = useState('');
    const [id, setId] = useState('');
    const [password, setPassword] = useState('');
    const [validationErrors, setValidationErrors] = useState({});

    const handleNameChange = (e) => {
        setName(e.target.value);
    };

    const handleJuminChange = (e) => {
        let newValue = e.target.value.replace(/[^0-9]/g, ''); // 숫자 이외의 문자 모두 제거
        if (newValue.length > 6) {
            newValue = newValue.slice(0, 6) + ' - ' + newValue.slice(6);
        }
        setJumin(newValue);
    };

    const handleIdChange = (e) => {
        setId(e.target.value);
    };

    const handlePasswordChange = (e) => {
        setPassword(e.target.value);
    };

    const checkError = () => {
        const errors = {};

        if (id.length < 3 || id.length > 30) {
            errors.id = '아이디는 3자 이상 30자 이하여야 합니다.';
        }

        if (
            !/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/.test(password)
        ) {
            errors.password =
                '비밀번호는 영문 대소문자, 숫자, 특수문자를 모두 포함하는 8자 이상 20자 이하여야 합니다.';
        }

        if (!/^\d{6} - \d{7}$/.test(jumin)) {
            errors.jumin = '올바른 주민번호 형식으로 입력해 주세요 (XXXXXX - XXXXXXX).';
        }
        setValidationErrors(errors); 
        return errors;
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        const errors = checkError();
        if (Object.keys(errors).length === 0) {
            console.log('Name:', name);
            console.log('주민번호:', jumin);
            console.log('아이디:', id);
            console.log('비밀번호:', password);
        }
    };

    return (
        <div className="signup-container">

            <Head><title>Sign up</title></Head>

            <h2>Sign up</h2>
            <form onSubmit={handleSubmit} className="signup-form-wrapper">
                <input
                    type="text"
                    id="name"
                    value={name}
                    onChange={handleNameChange}
                    placeholder='성명'
                />    

                <input
                    type="text"
                    id="jumin"
                    value={jumin}
                    onChange={handleJuminChange}
                    placeholder='주민번호 (XXXXXX - XXXXXXX)'
                />

                {validationErrors.jumin && (
                    <p className="error">{validationErrors.jumin}</p>
                )}

                <input
                    type="text"
                    id="id"
                    value={id}
                    onChange={handleIdChange}
                    placeholder='Id'
                />
                {validationErrors.id && (
                    <p className="error">{validationErrors.id}</p>
                )}

                <input
                    type="password"
                    id="password"
                    value={password}
                    onChange={handlePasswordChange}
                    placeholder='Password'
                />
                {validationErrors.password && (
                    <p className="error">{validationErrors.password}</p>
                )}
                <input type="submit" value="회원가입"></input>
            </form>
        </div>
    );
}
