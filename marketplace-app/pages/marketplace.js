import Head from 'next/head'
import 'bulma/css/bulma.css'
import styles from '../styles/Marketplace.module.css'

export default function Marketplace() {
    return(
        <div className={styles.main}>
    <Head>
        <title>Marketplace Dapp</title>
        <meta name="description" content="Marketplace for buyers and suppliers" />
    </Head>
    <nav className="navbar">
        <div className ="container">
            <div className="navbar-brand">
                <h1>Marketplace</h1>
            </div>
            <div className="navbar-end">
                <button className="button is-primary">Connect wallet</button>
            </div>
        </div>
    </nav>
    <section>
        <div className="container">
            <p>placeholder text</p>
        </div>
    </section>
        </div>
    )
}