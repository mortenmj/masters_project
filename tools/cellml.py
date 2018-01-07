# -*- coding: utf-8 -*-
"""
    pygments.lexers.modeling
    ~~~~~~~~~~~~~~~~~~~~~~~~

    Lexers for modeling languages.

    :copyright: Copyright 2006-2017 by the Pygments team, see AUTHORS.
    :license: BSD, see LICENSE for details.
"""

from pygments.lexer import RegexLexer, include, bygroups, using, default
from pygments.token import Text, Comment, Operator, Keyword, Name, String, \
    Number, Punctuation

from pygments.lexers.html import HtmlLexer

__all__ = ['CellMLLexer']


class CellMLLexer(RegexLexer):
    """
    Pygments Lexer for CellML.

    .. versionadded:: x.x
    """

    name = 'CellML'
    aliases = ['cellml']
    filenames = ['*.input']

    _name = r"(?:'(?:[^\\']|\\.)+'|[a-zA-Z_]\w*)"

    tokens = {
        'whitespace': [
            (u'[\\s\ufeff]+', Text),
            (r'//[^\n]*\n?', Comment.Single),
            (r'/\*.*?\*/', Comment.Multiline)
        ],
        'root': [
            include('whitespace'),
            (r'"', String.Double, 'string'),
            (r'[()\[\]{},;]+', Punctuation),
            (r'\.?[*^/+-]|\.|<>|[<>:=]=?', Operator),
            (r'\d+(\.?\d*[eE][-+]?\d+|\.\d*)', Number.Float),
            (r'\d+', Number.Integer),
            (r'(in|out)\b', Operator.Word),
            (r'(def model|def comp|def unit|enddef)\b', Keyword.Reserved, 'class'),
            (r'(as|expo|init|pub|pref|parameter|var|vars|unit|dimensionless|between|and|for|using|comp|priv|time)\b', Keyword.Reserved),
            (r'(ode)\b', Name.Builtin),
            (_name, Name)
        ],
        'class': [
            include('whitespace'),
            (r'(function|record)\b', Keyword.Reserved),
            (r'(if|for|when|while)\b', Keyword.Reserved, '#pop'),
            (_name, Name.Class, '#pop'),
            default('#pop')
        ],
        'string': [
            (r'"', String.Double, '#pop'),
            (r'\\[\'"?\\abfnrtv]', String.Escape),
            (r'(?i)<\s*html\s*>([^\\"]|\\.)+?(<\s*/\s*html\s*>|(?="))',
             using(HtmlLexer)),
            (r'<|\\?[^"\\<]+', String.Double)
        ]
    }
