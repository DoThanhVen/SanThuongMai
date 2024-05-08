import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { callAPI } from '../service/API';
import './BankList.css';
import { useLocation, useNavigate } from 'react-router';
import { ThongBao } from '../service/ThongBao'
import { GetDataLogin } from '../service/DataLogin';
import { useDispatch } from 'react-redux';
import cartSilce from "../Reducer/cartSilce";
const VNPayBankSelection = () => {
    const [bankList, setBankList] = useState([]);
    const location = useLocation();
    const [status, setStatus] = useState('');
    const [amount, setamount] = useState(0);
    const navigate = useNavigate();
    const dispatch = useDispatch();
    const [idAccountOrder, setIdAccountOrder] = useState('')
    let id = localStorage.getItem('idA')
    const [orderSaved, setOrderSaved] = useState(false);
    useEffect(() => {
        fetchData();
        const params = new URLSearchParams(location.search);

        const statusParam = params.get('status');
        const totalPrice = params.get('price');
        if (totalPrice !== null) {
            setamount(totalPrice)
        }
        if (statusParam !== null) {
            if (statusParam === 'success') {
                saveOrder()
                navigate('/pay')
                ThongBao('Thanh toán thành công','success')
                return;
            } else {
                ThongBao('Thanh toán thất bại', 'error')
                return;
            }
        } else {
            console.log('vô')
            return;
        }
    }, []);

    const saveOrder = async () => {
        console.log('s')
        const order = JSON.parse(localStorage.getItem('order'));
        const accessToken = sessionStorage.getItem("accessToken");
        console.log('order', order)
        const config = {
            headers: {
                Authorization: `Bearer ${accessToken}`
            }
        };
        let url = '';
        if (idAccountOrder !== null) {
            url = `/api/auth/order/create/account/${id}`
        } else {
            url = `/api/auth/order/create/account/${id}`
        }
        let orderNew = { ...order, pay: true }
        const response = await callAPI(
            url,
            "POST",
            orderNew,
            config
        )
        if (response && response.status === "SUCCESS") {
            dispatch(cartSilce.actions.removeAll());
            localStorage.removeItem("order")
            localStorage.removeItem("idA")
            return;
        }
    }

    const fetchData = async () => {
        try {
            const response = await axios.get('https://api.vietqr.io/v2/banks?utm_source=j2team&utm_medium=url_shortener&utm_campaign=bank-list-api');
            if (response.data && response.data.data) {
                setBankList(response.data.data);
            }
        } catch (error) {
            console.error('Error fetching bank list:', error);
        }
    };
    const Pay = async (bank) => {
        if (bank.code !== 'NCB') {
            ThongBao("Đọc kĩ hướng dẫn.", "error")
            return;
        }
        try {
            const res = await callAPI(`/pay?price=${amount}&typeBank=${bank.code}`, 'GET');
            window.location.href = res; // Redirect to the payment URL
        } catch (error) {
            console.error('Payment error:', error);
        }
    };

    return (
        <div>
            <h1>Danh sách ngân hàng</h1>
            <div className="bank-note">
                <p>Lưu ý: Chỉ chọn Ngân hàng TMCP Quốc Dân NCB và điền đúng thông tin sau:</p>
                <p>Số thẻ: 9704198526191432198 <br />
                    Tên chủ thẻ: NGUYEN VAN A <br />
                    Ngày phát hành: 07/15 <br />
                    Mật khẩu OTP: 123456</p>
            </div>
            <div className="bank-list">
                {bankList.map((bank, index) => (
                    <div key={index} className="bank-item" onClick={() => Pay(bank)}>
                        <img src={bank.logo} alt={bank.shortName} />
                        <p>{bank.name}</p>
                    </div>
                ))}
            </div>
        </div>
    );
};

export default VNPayBankSelection;
