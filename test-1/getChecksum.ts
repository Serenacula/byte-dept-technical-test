/**
 * This also accepts string, since the expected data is larger than javascript number allows, so would
 * need to be registered as a string as a string
 */

export default function getChecksum(data: string | number) {
    // Converting it to string to manipulate digits
    // const data = data.toString()

    if (typeof data === "number") {
        data = data.toString()
    }
    if (data === "Infinity") {
        throw Error(
            "data received was too large for the number type. Please convert it to a string."
        )
    }

    const dataAsArray = Array.from(data + data.charAt(0))

    let sum = 0
    for (const [index, digit] of dataAsArray.entries()) {
        if (digit === dataAsArray[index + 1]) {
            sum += Number(digit)
        }
    }

    // console.log(`checksum calculated: ${sum}`)

    return sum
}
