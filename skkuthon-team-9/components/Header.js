import Link from "next/link";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faUserNurse } from "@fortawesome/free-solid-svg-icons";

import styles from "./Header.module.css";

const Header = () => {
  return (
    <header className={styles.header}>
      <FontAwesomeIcon icon={faUserNurse} className={styles.logoImg} />
      <span className={styles.logoTitle}>SKKU Medical</span>
    </header>
  );
};

export default Header;
