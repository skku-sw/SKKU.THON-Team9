import { useRouter } from "next/router";
import Image from "next/image";

import styles from "./DiagnoseCard.module.css";

const DiagnoseCard = ({ diagnosis }) => {
  const router = useRouter();

  const date = diagnosis.hospitalization_dates.split(" 00:")[0];

  const onPDFClick = () => {
    router.push(diagnosis.filename);
  };

  return (
    <div>
      <div className={styles.pdf} onClick={onPDFClick}>
        <Image
          layout="responsive"
          src={"/images/pdf-logo.png"}
          alt="pdf image"
          width={100}
          height={100}
        />
      </div>
      <div className={styles.infoWrapper}>
        <span>{diagnosis.medical_institution}</span>
        <span>{date}</span>
      </div>
    </div>
  );
};

export default DiagnoseCard;
