#pragma once

#include <memory>
#include <QObject>
#include <QAudioBuffer>
#include <QVariantList>

namespace audio {
class Player : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantList byte READ byte NOTIFY byteChanged)

public:
    explicit Player(QObject *parent = 0);
    virtual ~Player();

    QVariantList byte() const;

signals:
    void byteChanged();

public slots:
    void doSomething(QString file);

private slots:
    void processBuffer(QAudioBuffer);

private:
    Q_DISABLE_COPY(Player)

    struct impl_t;
    std::unique_ptr<impl_t> impl;
};
} // namespace audio

