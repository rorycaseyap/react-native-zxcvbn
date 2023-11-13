export declare const score: (password?: string | null) => Promise<{ score: number, feedback: { warning: string, suggestions: string[] }}>;
