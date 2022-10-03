import getChecksum from "./getChecksum"
import fs from "fs/promises"

describe("tests for test-2", () => {
    test("basic checksum works", () => {
        const testData = `5	1	9	5
7	5	3
2	4	6	8`
        const testChecksum = 18

        expect(getChecksum(testData)).toBe(testChecksum)
    })

    test("01-general.tsv checksum works", async () => {
        const fileData = (await fs.readFile("01-general.tsv")).toString()
        const fileChecksum = 32121

        expect(getChecksum(fileData)).toBe(fileChecksum)
    })
})
