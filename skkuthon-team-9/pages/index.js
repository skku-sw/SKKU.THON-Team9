import Head from "next/head";
import Image from "next/image";
import Link from "next/link";

import styles from "../styles/Main.module.css";

export default function Home() {
  return (
    <>
      <Head>
        <title>SKKU Medical</title>
        <meta name="description" content="Generated by create next app" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <main className={styles.main}></main>
    </>
  );
}
