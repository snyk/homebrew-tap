class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1286.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1286.1/snyk-macos"
    sha256 "5413591ee90379ad23acb3f7726bfe43885dd20170c5178808257466b4e73239"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1286.1/snyk-macos-arm64"
    sha256 "d0d0db1bd1462bfd99f33409ed498274e7f450715828c54b113ab33f65e0bd1b"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1286.1/snyk-linux"
    sha256 "0bc957445408ebfc92535f8f6617ab7e0f34fc6e8c37985969b403ba0b55b4e3"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1286.1/snyk-linux-arm64"
    sha256 "20b0d93c7fdff7162142cf02d82f067d702649fd364f760b15d11658fa98f05d"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
