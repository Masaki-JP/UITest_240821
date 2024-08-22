import SwiftUI

struct PictureView: View {
    @State private var uiImage: UIImage?

    var body: some View {
        VStack {
            if let uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .accessibilityIdentifier("Picture")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .task {
            guard let url = URL(string: "https://picsum.photos/3840/2160"),
                  let (data, _) = try? await URLSession.shared.data(from: url),
                  let uiImage = UIImage(data: data)
            else { return }

            self.uiImage = uiImage
        }
    }
}

#Preview {
    PictureView()
}
