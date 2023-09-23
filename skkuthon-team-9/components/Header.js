import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faUserNurse } from "@fortawesome/free-solid-svg-icons";

import styles from "./Header.module.css";

const Header = () => {
  return (
    <header className={styles.header}>
      <div className={styles.logoWrapper}>
        <FontAwesomeIcon icon={faUserNurse} className={styles.logoImg} />
        <span className={styles.logoTitle}>SKKU Medical</span>
      </div>
      <div>
        <button className={styles.loginBtn}>Login</button>
      </div>
    </header>
  );
};

export default Header;