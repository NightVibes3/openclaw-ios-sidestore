import SwiftUI
// import Textual

public enum ChatMarkdownVariant: String, CaseIterable, Sendable {
    case standard
    case compact
}

@MainActor
public struct ChatMarkdownRenderer: View {
    public enum Context {
        case user
        case assistant
    }

    let text: String
    let context: Context
    let variant: ChatMarkdownVariant
    let font: Font
    let textColor: Color

    public init(
        text: String,
        context: Context,
        variant: ChatMarkdownVariant = .standard,
        font: Font = .system(size: 14),
        textColor: Color = .primary
    ) {
        self.text = text
        self.context = context
        self.variant = variant
        self.font = font
        self.textColor = textColor
    }

    public var body: some View {
        let processed = ChatMarkdownPreprocessor.preprocess(markdown: self.text)
        VStack(alignment: .leading, spacing: 10) {
            StructuredText(markdown: processed.cleaned)
                .modifier(ChatMarkdownStyle(
                    variant: self.variant,
                    context: self.context,
                    font: self.font,
                    textColor: self.textColor))

            if !processed.images.isEmpty {
                InlineImageList(images: processed.images)
            }
        }
    }
}

private struct ChatMarkdownStyle: ViewModifier {
    let variant: ChatMarkdownVariant
    let context: ChatMarkdownRenderer.Context
    let font: Font
    let textColor: Color

    func body(content: Content) -> some View {
        content
            .font(self.font)
            .foregroundStyle(self.textColor)
            .textSelection(.enabled)
    }
}

@MainActor
private struct InlineImageList: View {
    let images: [ChatMarkdownPreprocessor.InlineImage]

    var body: some View {
        ForEach(images, id: \.id) { item in
            if let img = item.image {
                OpenClawPlatformImageFactory.image(img)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 260)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .strokeBorder(Color.white.opacity(0.12), lineWidth: 1))
            } else {
                Text(item.label.isEmpty ? "Image" : item.label)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
