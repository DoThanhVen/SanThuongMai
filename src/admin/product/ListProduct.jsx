import React, { useEffect, useState } from "react";
import style from "../../css/admin/product/listproduct.module.css";
import "react-datepicker/dist/react-datepicker.css";
import "react-datepicker/dist/react-datepicker.css";
import { useDispatch, useSelector } from "react-redux";
import { callAPI } from "../../service/API";
import { Pagination } from "@mui/material";
import moment from "moment";
import ModelDetail from "./ModelDetail";
import { getIdProductAdmin } from "../../service/Actions";
import ModalAction from "../../service/ModalAction";
import LoadingOverlay from "../../service/loadingOverlay";

function formatDate(date) {
  return moment(date).format("DD-MM-YYYY HH:mm:ss");
}

function ListProduct() {
  const dispatch = useDispatch();
  const data = useSelector((state) => state.idAccountAdmin);
  const [products, setProducts] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const numberPage = 10;
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [keyword, setkeyword] = useState('');
  const [keyfind, setkeyfind] = useState('');
  const [reload, setreload] = useState(0)
  const [sortBy, setsortBy] = useState('')
  const [sortType, setsortType] = useState('')
  const [filterbyStatus, setFilterStatus] = useState("")
  const [token, settoken] = useState(null);
  const [isLoading, setIsLoading] = useState(false);
  useEffect(() => {
    getdata(currentPage);
  }, [data, currentPage, reload, sortType, filterbyStatus]);

  const getdata = async (page) => {
    const tokenac = sessionStorage.getItem('accessToken');
    settoken(tokenac)
    try {
      setIsLoading(true);
      const response = await callAPI(
        `/api/product/getAll?key=${keyfind}&keyword=${keyword}&offset=${page - 1
        }&sizePage=${numberPage}&sort=${sortBy}&sortType=${sortType}&status=${filterbyStatus}`,
        "GET"
      );
      if (response) {
        setProducts(response.data.content || []);
        setTotalPages(response.data.totalPages || 1);
        setIsLoading(false);
      }

    } catch (error) {
      console.error("Error fetching data:", error);
    }
  };

  const openModal = () => {
    setShowModal(true);
  };

  const closeModal = () => {
    setShowModal(false);
  };

  const handlePageChange = (event, value) => {
    setCurrentPage(value);
  };

  const handleUpdateStatus = async (id, status) => {
    if (status !== 2) {
      const isConfirmed = await ModalAction("Bạn có chắc muốn thực hiện hành động này?", "warning");
      if (isConfirmed) {
        try {
          const config = {
            headers: {
              "Authorization": `Bearer ${token}`
            }
          };
          const acc = await callAPI(`/api/auth/getAccountbyIdProduct/${id}`, 'GET', {}, config);
          if (acc && acc.data !== null) {
            const formData = new FormData();
            formData.append('status', status);
            const res = await callAPI(`/api/auth/product/adminupdatestatus/${id}`, 'PUT', formData, config)
            getdata(currentPage, filterbyStatus)
            switch (status) {
              case 0:
                await callAPI(`/api/auth/sendEmail/${acc.data.infoAccount.email}?content=Sản phẩm có mã ${id} đã được phê duyệt`, 'GET', {}, config);
                break;
              case 1:
                await callAPI(`/api/auth/sendEmail/${acc.data.infoAccount.email}?content=Sản phẩm có mã ${id} đã bị cấm hoạt động`, 'GET', {}, config);
                break;
              default:
                break;
            }
          }
        } catch (error) {
          console.log(error);
        }
      }
    } else {
      return;
    }
  };

  function formatCurrency(price, promotion) {
    const formatter = new Intl.NumberFormat("vi-VN", {
      style: "currency",
      currency: "VND",
      minimumFractionDigits: 0
    });
    return formatter.format(price - price * (promotion / 100));
  }

  return (
    <React.Fragment>
      <div className={style.listProduct}>
        <div className={style.heading}>
          <div className={style.column}>
            <label className={style.title}>Danh sách sản phẩm</label>
            <div className={`${style.formSearch}`}>
              <select
                value={keyfind}
                onChange={(e) => {
                  setkeyfind(e.target.value);
                }}
                className={`${style.optionSelect}`}
              >
                <option value="id">Mã sản phẩm</option>
                <option value="name">Tên sản phẩm</option>
                <option value="shop">Tên cửa hàng</option>
              </select>
              <input
                className={`${style.inputSearch}`}
                type="text"
                onChange={(e) => {
                  setkeyword(e.target.value);
                }}
              />
              <button
                className={`${style.buttonSearch}`}
                onClick={() => {
                  setreload(reload + 1);
                }}
              >
                Tìm Kiếm
              </button>
            </div>
          </div>
        </div>

        <div className={style.sort}>
          <div className={`${style.sortProduct}`}>
            <label>Sắp xếp</label>
            <select
              value={sortBy}
              onChange={(e) => {
                setsortBy(e.target.value);
              }}
              className={`ms-2 ${style.optionSelect}`}
            >
              <option value="">Lựa chọn...</option>
              <option value={"id"}>Mã sản phẩm</option>
              <option value={"product_name"}>Tên sản phẩm</option>
              <option value={"price"}>Giá</option>
              <option value={"create_date"}>Ngày tạo</option>
            </select>
            {sortBy !== "" ? (
              <select
                value={sortType}
                onChange={(e) => {
                  setsortType(e.target.value);
                }}
                className={`${style.optionSelect}`}
              >
                <option value="asc">Tăng dần</option>
                <option value="desc">Giảm dần</option>
              </select>
            ) : null}
          </div>
          <div className={style.typeProduct}>
            <label>Trạng thái:</label>
            <select
              value={filterbyStatus}
              onChange={(e) => {
                setFilterStatus(e.target.value);
              }}
              className={`ms-2 ${style.optionSelect}`}
            >
              <option value="">Tất cả</option>
              <option value="0">Chờ Phê Duyệt</option>
              <option value="1">Đang Hoạt Động</option>
              <option value="2">Dừng Hoạt Động</option>
              <option value="3">Cấm Hoạt Động</option>
            </select>
          </div>
        </div>
        <div className={style.table}>
          <div className={style.tableHeading}>
            <label className={style.column}>Mã SP</label>
            <label className={style.column}>Hình ảnh</label>
            <label className={style.column}>Tên SP</label>
            <label className={style.column}>Loại SP</label>
            <label className={style.column}>Giá SP</label>
            <label className={style.column}>Ngày tạo</label>
            <label className={style.column}>Trạng thái</label>
            <label className={style.column} />
            <label className={style.column} />
          </div>
          {products.map((value, index) => (
            <div key={index} className={style.tableBody}>
              <label className={style.column}>{value.id}</label>
              <label className={style.column}>
                {value.image_product && value.image_product.length > 0 ? (
                  <img
                    key={value.image_product[0].id}
                    className={style.image}
                    src={value.image_product[0].url}
                    alt="Hình Ảnh"
                  />
                ) : (
                  <img
                    className={style.image}
                    src={`/images/nullImage.png`}
                    alt="Hình Ảnh"
                  />
                )}
              </label>
              <label className={style.column}>{value.product_name}</label>
              <label className={style.column}>
                {value.categoryItem_product?.type_category_item}
              </label>
              <label className={style.column}>
                {formatCurrency(value.price, 0)}
              </label>
              <label className={style.column}>
                {formatDate(value.create_date)}
              </label>
              <label className={style.column}>
                <i
                  className={`
    ${style.status}
    ${value.status === 0
                      ? `bi bi-exclamation-lg ${style.approval}`
                      : value.status === 1
                        ? `bi bi-check-lg ${style.active}`
                        : value.status === 2
                          ? `bi bi-x-lg ${style.ban}`
                          : value.status === 3 ? `bi bi-x-lg ${style.ban}` : `bx bxs-error-alt`
                    }
  `}
                ></i>
              </label>
              <label className={style.column}>
                <label
                  onClick={() => {
                    handleUpdateStatus(value.id, value.status);
                  }}
                  className={`btn ${style.updateStatus}`}
                  style={{
                    backgroundColor:
                      value.status === 0
                        ? "#34219E"
                        : value.status === 1
                          ? "green"
                          : value.status === 2
                            ? "red"
                            : value.status === 3
                              ? "red" : "#E74C3C"
                  }}
                  value={`${value.status}`}
                >
                  {value.status === 0
                    ? "Chờ Phê Duyệt"
                    : value.status === 1
                      ? "Đang Hoạt Động"
                      : value.status === 2
                        ? "Dừng Hoạt Động"
                        : value.status === 3
                          ? "Cấm hoạt động"
                          : "Lỗi"}
                </label>
              </label>
              <label className={style.column}>
                <i
                  className={`bi bi-eye ${style.show}`}
                  onClick={() => {
                    dispatch(getIdProductAdmin(value.id));
                    openModal();
                  }}
                ></i>
              </label>
            </div>
          ))}
        </div>
        <div
          className={style.paginationContainer}
          style={{
            display: "flex",
            justifyContent: "center",
            marginTop: "20px"
          }}
        >
          <Pagination
            count={totalPages}
            page={currentPage}
            onChange={handlePageChange}
            boundaryCount={2}
            variant="outlined"
            shape="rounded"
            size="large"
            showFirstButton
            showLastButton
          />
        </div>
      </div>
      {showModal && <ModelDetail status={showModal} toggleShow={closeModal} />}
      <LoadingOverlay isLoading={isLoading} />
    </React.Fragment>
  );
}

export default ListProduct;
