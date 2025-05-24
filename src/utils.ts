

export function with0xPrefix(str: string): string {
    if (str.startsWith("0x")) {
        return str;
    }
    return "0x" + str;
}