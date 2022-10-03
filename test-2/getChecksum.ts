export default function getChecksum(data: string) {
    const dataRows = data.split("\n")

    let sum = 0
    for (const row of dataRows) {
        const numbers = row.split("\t").map((number) => {
            return Number(number)
        })

        sum += Math.max(...numbers) - Math.min(...numbers)
    }

    // console.log(`checksum calculated: ${sum}`)

    return sum
}
