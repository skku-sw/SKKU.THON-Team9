import Header from "./Header";
import SideBar from "./SideBar";
import styles from "./Layout.module.css";

const Layout = ({ children }) => {
  return (
    <div>
      <Header />
      <section className={styles.main}>
        <SideBar />
        {children}
      </section>
    </div>
  );
};

export default Layout;
