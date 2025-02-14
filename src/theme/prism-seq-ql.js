// This file contains Prism.js definitions for the Seq-QL language syntax.

const wildcard = {
  pattern: /(?<!\\)\*/,
  alias: 'keyword',
}

// Strings quoted with " or '.
const string = {
  pattern: /"(?:\\.|[^"\\])*"|'(?:\\.|[^'\\])*'/,
  greedy: true,
  inside: {
    'keyword': wildcard,
    escapeBackslash: {
      pattern: /\\\\/,
      alias: 'constant',
    },
    escapeBinary: {
      greedy: true,
      pattern: /\\((x[0-9a-fA-F]{2})|(u[0-9a-fA-F]{4})|(U[0-9a-fA-F]{8}))/,
      alias: 'constant',
    },
    escape: {
      pattern: /\\[nrt]/,
      alias: 'constant',
    },
  },
}

// Raw strings are strings quoted with ` in which escape sequences are ignored.
const rawString = {
  pattern: /`(?:\\.|[^`\\])*`/,
  greedy: true,
  alias: 'string',
}

const number = {
  pattern: /\b\d+(?:\.\d+)?\b/,
  greedy: true,
}

// See more about prism.js default tokens here: https://prismjs.com/tokens.html
globalThis.Prism.languages['seq-ql'] = {
  'comment': {
    pattern: /#.*/,
    greedy: true,
  },
  'keyword': {
    pattern: /\b(?:AND|OR|NOT|TO|_exists_)\b/i,
    greedy: true,
  },
  'field': {
    pattern: /\b[a-zA-Z0-9_-]+(?=\s*:)/,
    greedy: true,
    alias: 'property',
  },
  'operator': {
    pattern: /[:()\[\],]/,
    greedy: true,
  },
  'range': {
    pattern: /\[[^\]]*\]/,
    greedy: true,
    inside: {
      'punctuation': /[\[\],]/,
      'number': number,
      'string': string,
    },
  },
  number,
  string,
  rawString,
  wildcard,
  punctuation: {
    pattern: /[:,]/,
    greedy: true,
  },
  pipe: {
    pattern: /\bfields\b/i,
    alias: 'keyword',
  },
};
