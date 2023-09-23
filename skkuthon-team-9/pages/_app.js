import Layout from "@/components/Layout";
import "@/styles/globals.css";
import "@/styles/signup.css";
import "@/styles/login.css";


export default function App({ Component, pageProps }) {
  return (
    <Layout>
      <Component {...pageProps} />
    </Layout>
  );
}
