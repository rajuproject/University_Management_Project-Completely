
import app from './app'
import config from './config';


async function main() {
    app.listen(config.port, () => {
        
        console.log(`Server running at ${config.port}`);
    })
}

main();