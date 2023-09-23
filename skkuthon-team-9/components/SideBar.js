import Image from "next/image";

import styles from "./SideBar.module.css";

const SideBar = () => {
  return (
    <section className={styles.sidebar}>
      <div>
        <div className={styles.profileImg}>
          <Image
            layout="responsive"
            src={"/images/patient.jpeg"}
            alt="Patient's Profile Pic"
            width={100}
            height={100}
          />
        </div>
        <div className={styles.patientInfo}>
          <span>이성균</span>
          <span>111111-3333333</span>
        </div>
      </div>
    </section>
  );
};

export default SideBar;
